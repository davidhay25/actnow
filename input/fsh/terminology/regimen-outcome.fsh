ValueSet : RegimenOutcome
Id: an-regimen-outcome-vs
Title: "Outcome of a regimen"
Description:  "How did applying the regimen affect the patient"

* ^url = $regimen-outcome-vs
* ^experimental = false


* $snomed#268910001	"Patient improved"
* $snomed#359748005 "Patient unchanged"
* $snomed#271299001 "Patient worse"

/*

CodeSystem:  RegimenOutcome
Id: an-regimen-outcome-cs
Title: "Outcome of a regimen"
Description:  "How did applying the regimen affect the patient"


* ^url = $regimen-outcome-cs
* ^experimental = true
* ^caseSensitive = true

* #better "Better" "The patient was improved"
* #worse "Worse" "The patient was not improved"

*/
