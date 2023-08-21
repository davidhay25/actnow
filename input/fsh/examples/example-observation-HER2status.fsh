Instance: HER2Status
InstanceOf: ObservationHer2Status

* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>BSA</div>"
* text.status = #generated

* meta.profile = $her2-status

* subject = Reference(exPatient)
* performer = Reference(exPractitioner) //avoid the warning from the validator
* identifier.system = "http://canshare.co.nz/identifiers"
* identifier.value = "bsa"

* effectiveDateTime = "2020-01-01"
* status = #final

* code.coding[+] = $snomed#423740007 

* valueCodeableConcept = $snomed#416053008 "Estrogen receptor positive tumor (disorder)"