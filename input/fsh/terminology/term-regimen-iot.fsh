//Intent of Treatment

ValueSet : RegimenIOT
Id: an-regimen-iot-vs
Title: "Intent of treatment"
Description:  "What was the purpose of this treatment"


* ^url = $regimen-iot-vs
* ^experimental = false
* codes from system $regimen-iot-cs


CodeSystem:  RegimenIOT
Id: an-regimen-iot-cs
Title: "Intent of treatment"
Description:  "What was the purpose of this treatment"


* ^url = $regimen-iot-cs
* ^experimental = true
* ^caseSensitive = true

* #curative "Curative" "The intent is to cure the cancer"
* #palliative "Palliative" "The intent is to make the patient more comfortable"


