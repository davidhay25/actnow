Instance: HER2Status
InstanceOf: ObservationHer2Status
Description: "Example of a HER2 status observation. This is a simple example that only includes the required elements and a few optional ones. It is not meant to be a comprehensive example of all the possible elements that could be included in a HER2 status observation."

* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>BSA</div>"
* text.status = #generated

* meta.profile = $her2-status

* subject = Reference(exPatient)
* performer = Reference(exPractitioner) //avoid the warning from the validator
* identifier.system = "http://canshare.co.nz/identifiers"
* identifier.value = "bsa"

* effectiveDateTime = "2020-01-01"
* status = #final

* code.coding[snomedCode] = $snomed#476171000210109 

//#476171000210109

* valueCodeableConcept = $snomed#416053008 "Estrogen receptor positive tumor (disorder)"