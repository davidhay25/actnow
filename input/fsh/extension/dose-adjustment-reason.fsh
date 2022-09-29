Extension: DoseAdjustmentReason
Id: an-dose-adjustment-reason
Description: "The reason why the dose given was not the same as that in the regimen"

* ^url = $extDoseAdjustmentReason
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^context[+].type = #element
* ^context[=].expression = "MedicationAdministration"

* ^status = #draft
* value[x] only CodeableConcept