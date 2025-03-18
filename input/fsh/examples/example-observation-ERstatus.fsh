Instance: ERStatus
InstanceOf: ObservationErStatus

* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>ER status</div>"
* text.status = #generated

* meta.profile = $er-status

* subject = Reference(exPatient)
* performer = Reference(exPractitioner) //avoid the warning from the validator
* identifier.system = "http://canshare.co.nz/identifiers"
* identifier.value = "er"

* effectiveDateTime = "2020-01-01"
* status = #final

* code.coding[snomedCode] = $snomed#445028008 

* valueCodeableConcept = $snomed#303171000210101 "ER negative"