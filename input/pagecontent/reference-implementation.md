
To support the development of the CanShare system, a Reference Implementation (RI) has been created that can store resources in the defined format in a standard FHIR server, and then render them in an 'example' user Interface as well as allowing API access.

The  [input API](api-input.html) and  [query API](api-query.html) is also supported at the base url **http://actnow.canshare.co.nz:9092/baseR4/** . So it's feasible to add data to the RI by POSTing a [transaction bundle](api-input.html#bundle-layout) to the end point, then viewing it in the RI (using the regimen or NHI search options) and querying through the API. 

Populated with real (but de-personalized) data, it shows the resources - and the references between those resources - in a graphical manner, to assist with understanding the details of the guide. 

There also a validation end-point provided at https://actnow.canshare.co.nz/an/validateTransaction
POSTing a bundle to this endpoint causes 2 levels of validation:
* Code based validation that:
  * Ensures each resource exists and has a conformance profile claim
  * That the ids are UUID's and the fullUrl is present 
  * That each entry is a conditional update
* Performs a standard $validate against the ACT-NOW profiles on the public HAPi server.

Currently, validation should be performed using the public HAPI server which has a copy of the conformance resources. The validation capabilities of the RI are under development.




### User Interface

The User Interface of the application can be viewed at [this link](https://actnow.canshare.co.nz/) and consists of a number of tabs, the more important of which are described below. Note that the application is in constant development, so may not completely reflect the description here.

As there is only a small number of patients in the application, they are displayed in a dropdown control. Selecting a patient retrieves all of their data (using the [$everything operation](http://hl7.org/fhir/patient-operation-everything.html)) and then renders the different views from these resources. This is likely a similar approach that a 'real' application could take, though there are many other possibilities.

It is also possible to retrieve a patient based on the regimen identifier.

#### Resource graph
The graph tab shows the resources from the selected patient displayed as a graph with boxes representing the resource instances and lines between them representing the references. Clicking on any of the resource instances will display the json view of the resource in the right hand pane. Note that in most cases these resources will be incomplete (though compliant). 

<img style="width:800px; float:none" src="angraph.png"/>

Note that there are 2 types of medication that can appear in the view.

[MedicationAdministration](/StructureDefinition-an-medication-administration.html) resources are those actually given (administered) to the patient by a practitioner.
[MedicationRequest](StructureDefinition-an-medication-request.html) resources represent a prescription - so the practitioner cannot be sure whether the medication was actually taken.

#### Timeline view
This presents the medications along a timeline of administration date. Selecting an administration (the square box in the timeline) will display the resource to the right. The intent here is to show how data from CanShare can be used for clincial care delivery - the timeline view is a common one in medical systems.

<img style="width:800px; float:none" src="timeline.png"/>

To view the individual resources, click the small square box in the medication row. Like the graph, the resource instance will be shown to the right. Some of the squares as red - these are Observations (like [BSA](StructureDefinition-an-bsa.html)) that have a reference to the medication as well as to the cycle. Additional references are supported.

#### Cycles view
Displays the cycles of treatment in a tabluar format. Both CarePlan and MedicationAdministration / MedicationRequest can be displayed.

<img style="width:800px; float:none" src="cycles.png"/>


Clicking the cycle number in the first column will display the [cycle CarePlan](StructureDefinition-an-careplan-cycle.html) to the right.

Clicking the hyperlinked drug name in the last column will disply the MedicationAdministration resource instnce to the right. Unlike the timeline view, currently only the MedicationAdministration resources are displayed in the view.


### Validation endpoint
To assist with development, the RI exposes a validation endpoint that accepts a bundle, and performs validation without saving the data in the server.

Under development. For the meantime, use the [FHIR validation](#fhir-validation) endpoints described below.

### Submission endpoint
An endpoint that receives a transaction bundle and saves the data in the server (assuming that it passes validation). Once successfully saved, the patient can be retrieved in the User Interface, and the resources and references examined.

Under development.

### FHIR validation

There is a [validation operation](http://hl7.org/fhir/resource-operation-validate.html) defined in the FHIR spec that uses the conformance resources (profiles, extension defintions and terminology) to validate resources against the specification. This works against both single resources and bundles of resources (though the bundles shouldn't be too big).

Currently, the StructureDefinitions describing profiles & extensions are posted to the [public HAPI server](http://hapi.fhir.org/baseR4/) - the intention is that these will be also hosted by the Reference Implementation once the server there has been updated. Note that the validation process is triggered by including the conformance claim (ie the profile) in the meta.profile element.

<!-->
The base url of the FHIR server exposed by the reference implementation is **https://r4.ontoserver.csiro.au/fhir/** (This is a temporary endpoint and the location may change)
-->

#### Individual resource validation

To validate a single resource instance requires that the profile url be placed in the resource to be validated (technically it can be specified separately, but the server in use currently requires it).

The canonical url for each profile is found on the [profiles](profiles.html) tab.

For example, suppose you are wanting to validate a regimen CarePlan resource.

From the profiles tab, the canonical url is found to be: **http://canshare.co.nz/fhir/StructureDefinition/an-careplan-regimen**

This url is added to the resource meta section like so:

```
...
 "meta" : {
    "profile" : [
      "http://canshare.co.nz/fhir/StructureDefinition/an-careplan-regimen"
    ]
  },
  ...
  ```

(Note that all the examples published in the spec have this declaration)

Then, POST the resource to the validation operation type endpoint - **[server base url]/{resourceType}/$validate**  Make sure to set the **content-type** header to **application/fhir+json**

In the case of the CarePlan this would be: **http://actnow.canshare.co.nz:9092/baseR4/CarePlan/$validate**

The response will be an [OperationOutcome](http://hl7.org/fhir/operationoutcome.html) with details of any errors, and the status code will indicate if the resource passed validation.

It is recommended that implementers use this facility extensively during development.

#### Bundle validation

Bundle validation works in a similar way. Each resource must have the profile set in the meta element as for single resource validation.

The bundle is posted to **http://actnow.canshare.co.nz:9092/baseR4/Bundle/$validate**

The response is also an OperationOutcome - any errors / issues / warnings will refer to the index of the resource within the bundle. This can be tricky to understand, which is why single resource validation is often more useful to start with.