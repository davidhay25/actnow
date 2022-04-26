Extension: ClinicalTrial
Id: clinical-trial
Description: "Is on a clinical trial"
* ^url = $clinicalTrial
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^context[+].type = #element
* ^context[=].expression = "CarePlan"

* ^status = #draft
* value[x] only boolean