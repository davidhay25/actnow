Instance: CreatinineClearance
InstanceOf: ObservationCreatClear

* meta.profile = $creat-clear

* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Creatinine Clearance</div>"
* text.status = #generated

* subject = Reference(exPatient)
* performer = Reference(exPractitioner) //avoid the warning from the validator
* effectiveDateTime = "2020-01-01"
* status = #final
* identifier.system = "http://canshare.co.nz/identifiers"
* identifier.value = "cc"

//add 2 codings - one is the required snomed code, the other is an example extra one to demonstrate that others are allowed
* code = $snomed#102811001

* valueQuantity.value = 1.9
* valueQuantity.code = #mL/s
* valueQuantity.system = "http://unitsofmeasure.org"