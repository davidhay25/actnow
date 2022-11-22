/*
    The day of the cycle that this administration was made on
*/


Extension: FacilityAdministered
Id: an-facility-administered
Description: "The facility where the medication was given. The HPI code of the facility"
* ^url = $extFacilityAdministered
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^context[+].type = #element
* ^context[=].expression = "MedicationAdministration"

* ^status = #draft

* value[x] only CodeableConcept     //todo add HPI facility VS
