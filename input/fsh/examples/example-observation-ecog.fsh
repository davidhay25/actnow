Instance: ExObservationECOG
InstanceOf: ObservationEcog

* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>ECOG score 3 </div>"
* text.status = #generated

* subject = Reference(exPatient)
* performer = Reference(exPractitioner) //avoid the warning from the validator
* effectiveDateTime = "2020-01-01"
* status = #final

//add 2 codings - one is the required snomed code, the other is from mcode
* code.coding[+] = $snomed#423740007
* code.coding[+] = $loinc#89247-1

* valueInteger = 3
