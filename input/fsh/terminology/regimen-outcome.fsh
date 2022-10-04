ValueSet : RegimenOutcome
Id: an-regimen-outcome-vs
Title: "Outcome of a regimen"
Description:  "How did applying the regimen affect the patient"

* ^url = $regimen-outcome-vs
* ^experimental = false
* codes from system $regimen-outcome-cs


CodeSystem:  RegimenOutcome
Id: an-regimen-outcome-cs
Title: "Outcome of a regimen"
Description:  "How did applying the regimen affect the patient"


* ^url = $regimen-outcome-cs
* ^experimental = true
* ^caseSensitive = true

* #better "Better" "The patient was improved"
* #worse "Worse" "The patient was not improved"


