Instance: bsa
InstanceOf: ObservationBSA

* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>BSA</div>"
* text.status = #generated

* meta.profile = $bsa

* subject = Reference(exPatient)
* performer = Reference(exPractitioner) //avoid the warning from the validator
* identifier.system = "http://canshare.co.nz/identifiers"
* identifier.value = "bsa"

* effectiveDateTime = "2020-01-01"
* status = #final
//code not really needed as sushi automatically populated required slices - https://github.com/FHIR/sushi/issues/1030

* code.coding[snomedCode] = $snomed#301898006 

/*
//add 2 codings - one is the required snomed code, the other is an example extra one to demonstrate that others are allowed
* code.coding[+] = $snomed#301898006 
* code.coding[+] = http://example.org#1223      //this generates a sushi warning that can be ignored

*/

* valueQuantity.value = 1.4