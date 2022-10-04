ValueSet : RegimenDiscontinuedPatientFactors
Id: an-regimen-discontinued-patient-factors-vs
Title: "Patient factors when discontinuing a regimen"
Description:  "Patient factors when discontinuing a regimen"

* ^url = $regimen-discontinued-patient-factors-vs
* ^experimental = false

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


