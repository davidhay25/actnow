Extension: LastAdminDate
Id: an-last-admin-date
Description: "The last date that a medication administration was made for this cycle"

* ^url = $extLastAdminDate //"http://hl7.org.nz/fhir/StructureDefinition/established"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

//should only appear on a regimen-outcome type of observation
* ^context[+].type = #element
* ^context[=].expression = "CarePlan"

* ^status = #draft

* value[x] only dateTime