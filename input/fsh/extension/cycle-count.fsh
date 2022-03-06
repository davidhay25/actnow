Extension: CycleCount
Id: cycle-count
Description: "The number of cycles that administered for a regimen"
* ^url = $extCycleCount //"http://hl7.org.nz/fhir/StructureDefinition/established"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

//should only appear on a regimen-outcome type of observation
* ^context[+].type = #element
* ^context[=].expression = "Observation"

* ^status = #draft

* value[x] only integer