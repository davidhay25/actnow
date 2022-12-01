Instance: medicationrequest-1
InstanceOf: AnMedicationRequest
Description: "An example medication administration"

* meta.profile = $profMedicationRequest

* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Allopurinol</div>"
* text.status = #generated

* subject = Reference(exPatient)

* identifier.system = $identifierSystem
* identifier.value = "ma-1"

* intent = #plan

//the reference to the cycle careplan
* supportingInformation[+] = Reference(careplan-cycle-1)

* status = #completed
* medicationCodeableConcept.text = "Allopurinol"

* authoredOn = "2014-04-09"
