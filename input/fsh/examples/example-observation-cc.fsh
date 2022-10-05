Instance: CreatinineClearance
InstanceOf: ObservationCreatClear

* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Creatinine Clearance</div>"
* text.status = #generated

* subject = Reference(exPatient)
* effectiveDateTime = "2020-01-01"
* status = #final

//add 2 codings - one is the required snomed code, the other is an example extra one to demonstrate that others are allowed
* code = $unknownSystem#cc 

* valueQuantity.value = 1.9
* valueQuantity.code = #mL/s
* valueQuantity.system = "http://unitsofmeasure.org"