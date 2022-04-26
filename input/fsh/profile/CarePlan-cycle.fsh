Profile:        CareplanCycle
Parent:         CarePlan
Id:             careplan-cycle
Title:          "Cycle Careplan"
Description:    "A CarePlan that represents a single cycle of treatment."

* ^url = "http://canshare.com/fhir/StructureDefinition/careplan-cycle"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^text.status = #additional
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>A CarePlan that represents a single cycle of treatment.</div>"

* title 1..1

* extension contains
    $extCycleNumber named cycle-number 1..1

//Must have a reference to the regimen plan
* partOf 1..1 

//slicing on category
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "category.code"
* category ^slicing.rules = #open
* category ^slicing.description = "Slice based on the category.code pattern"

* category contains 
    cyclecode 1..1 MS 

* category[cyclecode] ^short = "Cycle level carePlan"
* category[cyclecode] ^definition = "Code identifiying this carePlan as being at the cycle level"
* category[cyclecode].coding = http://canshare.com#cycleCP

