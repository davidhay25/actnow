Instance: ExObservationHeight
InstanceOf: ObservationHeight

* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Height 180 cm</div>"
* text.status = #generated

* subject = Reference(exPatient)
* performer = Reference(exPractitioner) //avoid the warning from the validator
* effectiveDateTime = "2020-01-01"
* status = #final

//add 2 codings - one is the required snomed code, the other is an example extra one to demonstrate that others are allowed
* code.coding[+] = $snomed#4565433019 
* code.coding[+] = $loinc#8302-2

* valueQuantity.value = 1.8
* valueQuantity.code = #m
* valueQuantity.system = "http://unitsofmeasure.org"

