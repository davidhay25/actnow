Profile:        CareplanCycle
Parent:         CarePlan
Id:             an-careplan-cycle
Title:          "Cycle Careplan"
Description:    "A CarePlan that represents a single cycle of treatment. It will have a 'partOf' reference to the regiment carePlan."

* ^url = $profCarePlan-cycle
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^text.status = #additional
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>A CarePlan that represents a single cycle of treatment.</div>"

* title 1..1

* extension contains
    $extCycleNumber named cycle-number 0..1  and //the sequention number of the cycle
    $extLastAdminDate named last-admin-date 0..1  //the last date of any administration under this cycle


* partOf 1..1       //Must have a reference to the regimen plan
* category 1..*     //must have at least the cycle category (sliced below)
* identifier 1..*   //identifier required for updates

//slicing on category. At least the defined code must be present
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "category.code"
* category ^slicing.rules = #open
* category ^slicing.description = "Slice based on the category.code pattern"

* category contains 
    cyclecode 1..1 MS 

* category[cyclecode] ^short = "Cycle level carePlan"
* category[cyclecode] ^definition = "Code identifiying this carePlan as being at the cycle level"
* category[cyclecode].coding = http://example.org#cycleCP

