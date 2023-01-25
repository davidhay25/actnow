Instance: PRStatus
InstanceOf: ObservationPrStatus

* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>PR Status</div>"
* text.status = #generated

* meta.profile =  $pr-status

* subject = Reference(exPatient)
* performer = Reference(exPractitioner) //avoid the warning from the validator
* identifier.system = "http://canshare.co.nz/identifiers"
* identifier.value = "pr"

* effectiveDateTime = "2020-01-01"
* status = #final

* code.coding[+] = $snomed#423740007 

* valueCodeableConcept = $snomed#416561008 "Progesterone receptor positive tumor (disorder)"