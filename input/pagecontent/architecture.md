

The systems is designed as a data aggregator - accepting data from a small number of systems (it is highly specialised) and saving it into a FHIR server as patient specific information.

This guide does not include security in detail.

The overall architecture of the proposed solution is as follows:

<img style="width:800px; float:none" src="architecture.png"/>

### Main components 


#### Client (Data source)
This is the source of ACT-NOW data into the repository. It is submitted as FHIR resources in a transaction bundle (link to details) at regular intervals, likely daily in the first instance. The bundle will be validated before being accepted. If it fails validation, then it will need to be corrected in the source system and re-submitted.

#### API Manager
The interface between external systems and the internal CanShare systems. It applies security and authentication / authorisation policies for both submitters of data and clients performing queries.

Given that there are only a small number of clients supplying data, there could be a separate endpoint for each client. This could help with provenance.

#### Integration engine / Validator
The validator is used to ensure that the data in the bundle is for for purpose. This occurs at a number of levels. (Link to details here) 
* Conformance to the profiling described in this Implementation Guide.
* Additional validation not covered by the standard FHIR validation mechanisms. For example:
    * The system values in the resources match that assigned to the data source
    * All updates are conditional updates

If the bundle fails validation, then it will be rejected and will need to be correct and re-submitted by the sender. This is primarily to ensure that the analytics is being performed against valid data - it i such harder to correct once it has been imported into the FHIR server.

This requirement does bring support requirements that are being developed. Specifically, the order that bundles are submitted is important, as some resources (particularly the Care Plans) are updated as part of the data acquisition.

This step will also add a Provenance resource to the bundle (it could be supplied by the originating system, though there is value in it being applied by the system.)

In this architecture, the validator function is performed by an Integration Engine - though other architectures are certainly feasible. However, it is assumed that the FHIR server is a 'generic' server and so will not be capable of the business level validation required.

#### FHIR repository
A FHIR server that holds the data as FHIR resources - currently version 4.0.1. It must support a number of the RESTful API interfaces - the most important being conditional updates, and support of the '[_since](http://hl7.org/fhir/http.html#history)' operator needed by the analytics toolchain. However, it is assumed that it will support the majority of the RESTful API for maximum flexibility for the query.

#### Analytics
This represents the toolchain that ultimately updates the analytics repository - currently a snowflake instance. This tool chain will incrementally query the FHIR server for data.

A key premise of the architecture is that validation is applied at data acquisition as described above. Hence, it should not be needed here (though could be applied if needed)

#### Client (query)
Represents an external client querying the data - such as an MDM meeting. Security is applied by the API manager.

#### CSV bundle creator
This is a component that create bundles from CSV files and submit them via the REST interface to the system. This is to support a legacy system that is capable of extracting data to csv, but not to FHIR. 

The component is depicted as being part of the Integration Engine (and so inside the system and doesn't necessarily need to go through the API manager), though it could be elsewhere.

There is a javascript component developed as part of the Reference Implementation that can do this action. It could serve as an example for development. 

The bundle creator may not be required, depending on business decisions.

<!--

---


overall architecture
    from previous google docs - include integration engine at front for validation
        external api simple receive transaction bundle
            endpoint can be specific for data source
                can check systems in bundle as well...
        ? also add provenance resource
            if so, store original in Bundle endpoint
    stephens diagrams
        links to analytics - query via rest calls
            not currently defined
    security not currently defined    
    aggregator
    store as fhir resources
    validation - details on a separate page - or in the API
-->