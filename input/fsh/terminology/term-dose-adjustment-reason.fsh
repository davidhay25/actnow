//Intent of Treatment

ValueSet : AnDoseAdjustmentReason
Id: an-dose-adjustment-reason-vs
Title: "Intent of treatment"
Description:  "What was the purpose of this treatment"


* ^url = $dose-adjustment-reason-vs
* ^experimental = false
* codes from system $dose-adjustment-reason-cs


CodeSystem:  AnDoseAdjustmentReason
Id: an-dose-adjustment-reason-cs
Title: "Intent of treatment"
Description:  "What was the purpose of this treatment"


* ^url = $dose-adjustment-reason-cs
* ^experimental = true
* ^caseSensitive = true

* #intol "Intolerance" "Patient intolerance of the recommended dose"
* #se "Side Effects" "Side effects from the recommended dose"


