Extension: CycleDay
Id: cycle-day
Description: "The day of the cycle that this medication was given on"
* ^url = $extCycleDay
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^context[+].type = #element
* ^context[=].expression = "MedicationAdministration"

* ^status = #draft

* value[x] only integer