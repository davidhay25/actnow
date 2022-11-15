ValueSet : EcogStatus
Id: an-ecog-status-vs
Title: "ECOG status"
Description:  "ECOG status"

* ^url = $ecog-status-vs
* ^experimental = false

* $snomed#2644680013	"ECOG performance status - grade 0"
* $snomed#2644681012	"ECOG performance status - grade 1"
* $snomed#2644682017	"ECOG performance status - grade 2"
* $snomed#2644683010	"ECOG performance status - grade 3"
* $snomed#2644684016	"ECOG performance status - grade 4"
* $snomed#2644685015	"ECOG performance status - grade 5"


/*
* codes from system $ecog-status-cs


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

