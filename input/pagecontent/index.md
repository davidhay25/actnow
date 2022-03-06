# ACT-NOW 

The [ACT-NOW specification](https://consult.health.govt.nz/hiso/act-now-data-standard/supporting_documents/HISO10095ACTNOWDataStandarddraftforpubliccomment.pdf) describes the data collection for oncology treatment in New Zealand.

Here is the [Logical Model](StructureDefinition-ActNowComplete.html) of the data items within the standard

<!--
This is the [Mapping table](ActNowCompletemapping.html) that shows how the elements in the model correspond to FHIR resources
-->

An [example bundle](http://clinfhir.com/bundleVisualizer.html?http://build.fhir.org/ig/davidhay25/canshare/branches/main/Bundle-an-completeBundle.json) viewed in clinFHIR

### Must Support

As this IG describes how to implement a national standard using FHIR, none of the resurce elements in the profiles have cardinality set to 0. Rather, the 'must support' flag is used to indicate those elements that are important when integrating with an application that is confirmant to the IG.

### Slicing

Slicing is used in a number of places to indicate codes that must be used for specific purposes. For example the carePlan.category is sliced to identify plans that represent a Regimen of treatment (often applied from a national repository) from a plan that tracks the individual administration of medications (and associated observations) during a cycle of treatment. 

The slicing used does not prevent other categories being used if needed.

There is a [separate IG](http://build.fhir.org/ig/HL7NZ/cca/branches/master/index.html) that describes how [PlanDefinition](http://hl7.org/fhir/plandefinition.html) and [ActivityDefinition](http://hl7.org/fhir/activitydefinition.html) resources are used to represent regimens of treatment, and there is an implementation of that IG available to users.

