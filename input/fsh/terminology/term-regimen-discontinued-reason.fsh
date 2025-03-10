ValueSet : RegimenDiscontinuedReason
Id: an-regimen-discontinued-reason-vs
Title: "The reason why a regimen was discontinued"
Description:  "The reason why a regimen was discontinued"

* ^url = $regimen-discontinued-reason-vs
* ^experimental = false

* $snomed#840539006 "COVID-19"
* $snomed#419099009 "Patient dead"
* $snomed#262061000210108 "Comorbidity (includes infection)"
* $snomed#262041000210107 "Disease progression"
* $snomed#74964007 "Other"
* $snomed#262051000210105 "Change of provider"
* $snomed#262071000210102 "Patient unable to be contacted"
* $snomed#7895008 "Drug toxicity"
* $snomed#365448001 "Social and personal factors"
* $snomed#445528004 "Treatment changed"
* $snomed#182992009 "Treatment completed"

/*

* codes from system $regimen-discontinued-reason-cs


CodeSystem:  RegimenDiscontinuedReason
Id: an-regimen-discontinued-reason-cs
Title: "The reason why a regimen was discontinued"
Description:  "The reason why a regimen was discontinued"

* ^url = $regimen-discontinued-reason-cs
* ^experimental = true
* ^caseSensitive = true

* #died "Died" "The patient died"
* #pf "PF" "Patient factors such as intolerance"
* #tox "TOX" "Toxicity"

*/