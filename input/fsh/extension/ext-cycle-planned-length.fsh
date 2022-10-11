
/*
    The planned length of this cycle. 

*/


Extension: CyclePlannedLength
Id: an-cycle-planned-length
Description: "The number of cycles that administered for a regimen"
* ^url = $extCyclePlannedLength 
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ


* ^context[+].type = #element
* ^context[=].expression = "CarePlan"

* ^status = #draft

* value[x] only integer