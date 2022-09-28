Extension: RegimenOTU
Id: regimen-otu
Description: "Outcome measure for a regimen"

* ^url = $extRegimenOTU
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^status = #draft

* ^context.type = #element
* ^context.expression = "Observation"

* extension contains
    benefit 0..1 and
    acceptable 0..1 

// definitions of sub-extensions
* extension[benefit].url = "benefit" (exactly)
* extension[benefit] ^definition = "Benefit"
* extension[benefit] ^short = "Benefit"
* extension[benefit].value[x] only integer

* extension[acceptable].url = "acceptable" (exactly)
* extension[acceptable] ^definition = "Acceptable"
* extension[acceptable] ^short = "acceptable"
* extension[acceptable].value[x] only integer
