

The [ACT-NOW specification](https://consult.health.govt.nz/hiso/act-now-data-standard/supporting_documents/HISO10095ACTNOWDataStandarddraftforpubliccomment.pdf) describes the data collection for oncology treatment in New Zealand.

This Guide describes how this data is represented as FHIR resources, and collected into a FHIR server for subsequent use such as Analytics and Care delivery.

As such it describes an actual system, rather than a definition of how interoperability works in a particular domain.

The intention is that it will inform the choice of architectural components needed for a production grade deployment, as well as the requirements for vendors supplying data to the system.

There are a number of sections to the Guide, represented as tabs at the top of the guide.

* The [Overview](overview.html) describes how the clinical information is represented as FHIR resources
* The [Architecture](architecture.html) section describes the high level architectire of the proposed solution. This is intended to provide the requirements for the implementers of the system. and may be adapted as the project progresses. However, it will remain a high level description - the implementation details will not be repreented in this guide.
* The API section has 2 sub sections.
    * The [Input API](api-input.html) describes how data is sent from the client to the server via the RESTful API
    * The [Query API](api-query.html) describes what queries the system needs to support.
* [Examples](examples.html) contains a list of example resources
* [Extensions](extensions.html) is a summary of extensions
* [Profiles](profiles.html) lists the profiles defined here
* [Terminology](terminology.html) contains ValueSets needed by the profiles & extensions 
* The [Reference Implementation](reference-implementation.html) describes applications that have been created to assist with development and demonstrate the kinds of interface that could be built with the ACT-NOW data
* And finally the Support tab allows downloading of this guide and all the artifacts defined as computable resources in a number of formats, as well as a link to the main [FHIR specification](http://hl7.org/fhir/index.html).


<!--

>>> more details on data collected


purpose of project
    analytics
    care delivery

focus of this IG

dependency on NZBase, mcode

Here is the [Logical Model](StructureDefinition-ActNowComplete.html) of the data items within the standard

>>> describe key parts of IG - API, resource graph, architecture


This is the [Mapping table](ActNowCompletemapping.html) that shows how the elements in the model correspond to FHIR resources
An [example bundle](http://clinfhir.com/bundleVisualizer.html?http://build.fhir.org/ig/davidhay25/canshare/branches/main/Bundle-an-completeBundle.json) viewed in clinFHIR

-->




<!--
### Must Support

As this IG describes how to implement a national standard using FHIR, none of the resurce elements in the profiles have cardinality set to 0. Rather, the 'must support' flag is used to indicate those elements that are important when integrating with an application that is confirmant to the IG.

### Slicing

Slicing is used in a number of places to indicate codes that must be used for specific purposes. For example the carePlan.category is sliced to identify plans that represent a Regimen of treatment (often applied from a national repository) from a plan that tracks the individual administration of medications (and associated observations) during a cycle of treatment. 

The slicing used does not prevent other categories being used if needed.


Relationship to other IGs
    cca regimens

There is a [separate IG](http://build.fhir.org/ig/HL7NZ/cca/branches/master/index.html) that describes how [PlanDefinition](http://hl7.org/fhir/plandefinition.html) and [ActivityDefinition](http://hl7.org/fhir/activitydefinition.html) resources are used to represent regimens of treatment, and there is an implementation of that IG available to users.

-->