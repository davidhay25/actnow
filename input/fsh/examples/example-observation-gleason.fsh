Instance: ExObservationGleason
InstanceOf: ObservationGleason

* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Gleason score</div>"
* text.status = #generated

* subject = Reference(exPatient)
* effectiveDateTime = "2020-01-01"
* status = #final

//add 2 codings - one is the required snomed code, the other is an example extra one to demonstrate that others are allowed
* code.coding[+] = $snomed#372278000 "Gleason score (observable entity)" 

* component[+].code = $snomed#384994009 ""
* component[=].valueInteger = 1



//--------------------------
/*
Instance: ExObservationNoValueSystemWeight
InstanceOf: ObservationWeight

* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Weight 80 kg</div>"
* text.status = #generated

* subject = Reference(exPatient)
* performer = Reference(exPractitioner) //avoid the warning from the validator
* effectiveDateTime = "2020-01-01"
* status = #final

//add 2 codings - one is the required snomed code, the other is an example extra one to demonstrate that others are allowed
* code.coding[+] = $snomed#45352010 
* code.coding[+] = $loinc#29463-7

* valueQuantity.value = 100
* valueQuantity.code = #kg



//an example that fails maxValue constraints - checked & works
Instance: ExObservationInvalidWeight
InstanceOf: ObservationWeight

* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Weight 80 kg</div>"
* text.status = #generated

* subject = Reference(exPatient)
* effectiveDateTime = "2020-01-01"
* status = #final

//add 2 codings - one is the required snomed code, the other is an example extra one to demonstrate that others are allowed
* code.coding[+] = $snomed#45352010 
* code.coding[+] = $loinc#29463-7

* valueQuantity.value = 300
* valueQuantity.code = #kg

*/