Instance: bsa
InstanceOf: observation-bsa
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>BSA</div>"
* text.status = #generated
* subject = Reference(anPatient)
* effectiveDateTime = "2020-01-01"
* status = #final
* code.coding[+] = $snomed#443403011 
* code.coding[+] = http://example.org#1223
* valueQuantity.value = 1.4