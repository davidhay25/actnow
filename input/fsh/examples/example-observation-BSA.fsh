Instance: bsa
InstanceOf: ObservationBSA

* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>BSA</div>"
* text.status = #generated

* subject = Reference(exPatient)
* effectiveDateTime = "2020-01-01"
* status = #final

//add 2 codings - one is the required snomed code, the other is an example extra one to demonstrate that others are allowed
* code.coding[+] = $snomed#443403011 
* code.coding[+] = http://example.org#1223
* valueQuantity.value = 1.4