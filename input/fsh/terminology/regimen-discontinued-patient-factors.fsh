ValueSet : RegimenDiscontinuedPatientFactors
Id: an-regimen-discontinued-patient-factors-vs
Title: "Patient factors when discontinuing a regimen"
Description:  "Patient factors that may result in the discontinuation of a systemic anti-cancer therapy (SACT) treatment plus not asked value."

* ^url = $regimen-discontinued-patient-factors-vs
* ^experimental = false

* $snomed#302767002 "Caring for family"
* $snomed#182872003 "Cost of drug"
* $snomed#160932005 "Financial reason"
* $snomed#423797009 "Lack of clinical support"
* $snomed#262081000210100 "Lack of psychosocial support"
* $snomed#261711000210100 "Not asked"
* $snomed#266934004 "Transport barriers"
* $snomed#182868002 "Patient pursuing other treatment"
* $snomed#262091000210103 "Insufficient perceived benefit of treatment by patient"


/*

* codes from system $regimen-discontinued-patient-factors-cs


CodeSystem:  RegimenDiscontinuedPatientFactors
Id: an-regimen-discontinued-patient-factors-cs
Title: "Patient factors when discontinuing a regimen"
Description:  "Patient factors when discontinuing a regimen"

* ^url = $regimen-discontinued-patient-factors-cs
* ^experimental = true
* ^caseSensitive = true

* #cost "Cost" "Unable to afford treatment"
* #travel "Travel" "Unable to travel to treatment facility"


*/