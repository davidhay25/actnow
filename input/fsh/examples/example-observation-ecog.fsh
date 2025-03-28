Instance: ExObservationECOG
InstanceOf: ObservationEcog

* meta.profile = $ecog

* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>ECOG score 3 </div>"
* text.status = #generated

* subject = Reference(exPatient)
* performer = Reference(exPractitioner) //avoid the warning from the validator
* effectiveDateTime = "2020-01-01"
* status = #final
* identifier.system = "http://canshare.co.nz/identifiers"
* identifier.value = "ecog"

//add 2 codings - one is the required snomed code, the other is from mcode
* code.coding[snomedCode] = $snomed#423740007
* code.coding[mCode] = $loinc#89247-1

* valueCodeableConcept = $snomed#425389002  "Eastern Cooperative Oncology Group performance status - grade 0 (finding)"
