Instance: PRStatus
InstanceOf: ObservationPrStatus
Description: "Example of a PR status observation. This is a simple example that only includes the required elements and a few optional ones. It is not meant to be a comprehensive example of all the possible elements that could be included in a PR status observation."


* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>PR Status</div>"
* text.status = #generated

* meta.profile =  $pr-status

* subject = Reference(exPatient)
* performer = Reference(exPractitioner) //avoid the warning from the validator
* identifier.system = "http://canshare.co.nz/identifiers"
* identifier.value = "pr"

* effectiveDateTime = "2020-01-01"
* status = #final

* code.coding[snomedCode] = $snomed#445029000 

* valueCodeableConcept = $snomed#416561008 "Progesterone receptor positive tumor (disorder)"