Instance: ExObservationWeight
InstanceOf: ObservationWeight

* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Weight 80 kg</div>"
* text.status = #generated

* subject = Reference(exPatient)
* effectiveDateTime = "2020-01-01"
* status = #final

//add 2 codings - one is the required snomed code, the other is an example extra one to demonstrate that others are allowed
* code.coding[+] = $snomed#45352010 
* code.coding[+] = $loinc#29463-7

* valueQuantity.value = 80
* valueQuantity.code = #kg
* valueQuantity.system = "http://unitsofmeasure.org"

//--------------------------

Instance: ExObservationNoValueSystemWeight
InstanceOf: ObservationWeight

* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Weight 80 kg</div>"
* text.status = #generated

* subject = Reference(exPatient)
* effectiveDateTime = "2020-01-01"
* status = #final

//add 2 codings - one is the required snomed code, the other is an example extra one to demonstrate that others are allowed
* code.coding[+] = $snomed#45352010 
* code.coding[+] = $loinc#29463-7

* valueQuantity.value = 100
* valueQuantity.code = #kg

/*

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