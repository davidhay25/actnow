Extension: CycleNumber
Id: cycle-number
Description: "The cycle number of the regimen that this CP represents"

* ^url = $extCycleNumber 
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^context[+].type = #element
* ^context[=].expression = "CarePlan"

* ^status = #draft

* value[x] only integer