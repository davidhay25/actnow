//https://blogs.ed.ac.uk/canceroutcomes/overall-treatment-utility/

Extension: RegimenOTU
Id: an-regimen-otu
Description: "Overall Treatment Utility measure for a regimen after it has completed."

* ^url = $extRegimenOTU
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^status = #draft

* ^context.type = #element
* ^context.expression = "CarePlan"

* extension contains
    benefit 0..1 and
    acceptable 0..1 

// definitions of sub-extensions
* extension[benefit].url = "benefit" (exactly)
* extension[benefit] ^definition = "Clinical benefit"
* extension[benefit] ^short = "Clinical benefit. Value can be 1 (not worse) or 0 (worse)"
* extension[benefit].value[x] only integer
* extension[benefit].valueInteger ^minValueInteger = 0
* extension[benefit].valueInteger ^maxValueInteger = 1

* extension[acceptable].url = "acceptable" (exactly)
* extension[acceptable] ^definition = "Patient acceptability"
* extension[acceptable] ^short = "Acceptable to the patient. Value can be 1 (nor worse or better) or 0 (made life worse)"
* extension[acceptable].value[x] only integer
* extension[acceptable].valueInteger ^minValueInteger = 0
* extension[acceptable].valueInteger ^maxValueInteger = 1

