ValueSet : RegimenDiscontinuedReason
Id: an-regimen-discontinued-reason-vs
Title: "The reason why a regimen was discontinued"
Description:  "The reason why a regimen was discontinued"

* ^url = $regimen-discontinued-reason-vs
* ^experimental = false
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

