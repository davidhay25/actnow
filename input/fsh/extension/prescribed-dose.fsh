Extension: PrescribedDose
Id: prescribed-dose
Description: "The dose of this medication in the regimen (may not be the same as that given"
* ^url = $extPrescribedDose
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^context[+].type = #element
* ^context[=].expression = "MedicationAdministration"

* ^status = #draft

* value[x] only Dosage