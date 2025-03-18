Extension: ClinicalTrial
Id: an-clinical-trial
Description: "Is on a clinical trial"
* ^url = $clinicalTrial
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^context[+].type = #element
* ^context[=].expression = "CarePlan"

* ^status = #draft
* value[x] only CodeableConcept


* valueCodeableConcept from https://nzhts.digital.health.nz/fhir/ValueSet/canshare-sact-drug-trial

ValueSet : ClinicalTrial
Id: an-clininal-trial
Title: "Is on a clinical trial"
Description:  "Is on a clinical trial"

* ^url = "https://nzhts.digital.health.nz/fhir/ValueSet/canshare-sact-drug-trial"
* ^experimental = false

* $snomed#185922005 "Clinical drug trial"
