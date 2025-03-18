Instance: ExObservationGleason
InstanceOf: ObservationGleason

* meta.profile = $gleason

* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Gleason score</div>"
* text.status = #generated

* subject = Reference(exPatient)
* effectiveDateTime = "2020-01-01"
* status = #final

//add 2 codings - one is the required snomed code, the other is an example extra one to demonstrate that others are allowed
* code.coding[snomedCode] = $snomed#372278000 "Gleason score (observable entity)" 

/* not sure why components are here
* component[+].code = $snomed#384994009 ""
* component[=].valueInteger = 1
*/



