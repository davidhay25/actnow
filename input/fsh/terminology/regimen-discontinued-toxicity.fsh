ValueSet : RegimenDiscontinuedToxicity
Id: an-regimen-discontinued-toxicity-vs
Title: "Toxicity reasons why a regimen was discontinued"
Description:  "Toxicity reasons why a regimen was discontinued"

* ^url = $regimen-discontinued-toxicity-vs
* ^experimental = false
* codes from system $regimen-discontinued-reason-cs


CodeSystem:  RegimenDiscontinuedToxicity
Id: an-regimen-discontinued-toxicity-cs
Title: "Toxicity reasons why a regimen was discontinued"
Description:  "Toxicity reasons why a regimen was discontinued"

* ^url = $regimen-discontinued-toxicity-cs
* ^experimental = true
* ^caseSensitive = true

* #nausea "Nausea" "Nausea could not be managed"
* #anaphylactic "Anaphylactic" "There was an Anaphylactic reaction to medication"


