Profile:        CareplanRegimen
Parent:         CarePlan
Id:             careplan-regimen
Title:          "Regimen Careplan"
Description:    "A CarePlan that represents a PlanDefinition being applied to a Patient."

* ^url = "http://canshare.com/fhir/StructureDefinition/careplan-regimen"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^text.status = #additional
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>A CarePlan that represents a PlanDefinition being applied to a Patient.</div>"


* title 1..1


//slicing on category
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "category.code"
* category ^slicing.rules = #open
* category ^slicing.description = "Slice based on the category.code pattern"

* category contains 
    regimencode 1..1 MS 

* category[regimencode] ^short = "Regimen level carePlan"
* category[regimencode] ^definition = "Code identifiying this carePlan as being at the regimen level"
* category[regimencode].coding = http://canshare.com#regimenCP

