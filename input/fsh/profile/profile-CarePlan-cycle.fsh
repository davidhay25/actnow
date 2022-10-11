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
* intent = #plan

//todo - actually, having the last admin date as an extension supposes that the CP is updated each time a medication
// is given - is this reasonable? Should we ditch the extension and have the client just check the Administrations?
// alternatively, we leave it there (it is optional) and the supplier updates it if they can...
* extension contains
    $extCyclePlannedLength named cycle-planned-length 1..1 and // the planned length of the sysle
    $extCycleNumber named cycle-number 1..1  and //the sequention number of the cycle
    $extLastAdminDate named last-admin-date 0..1  //the last date of any administration under this cycle


* partOf 1..1       //Must have a reference to the regimen plan
* partOf only Reference(CareplanRegimen)  //Must be a reference to a regimen care plan
* category 1..*     //must have at least the cycle category (sliced below)
* identifier 1..*   //identifier required for updates

* period.start 1..1     //must have the date the cycle starts

//slicing on category coding
* category.coding ^slicing.discriminator.type = #pattern
* category.coding ^slicing.discriminator.path = "code"
* category.coding ^slicing.rules = #open


* category.coding contains 
    cyclecode 1..1 MS 

* category.coding[cyclecode] ^short = "Cycle level carePlan"
* category.coding[cyclecode] ^definition = "Code identifying this carePlan as being at the cycle level"
* category.coding[cyclecode].code = #cycleCP
* category.coding[cyclecode].system = $unknownSystem

//Invariants

* obeys an-cycleCP-1

Invariant: an-cycleCP-1
Expression: "CarePlan.status = 'completed' implies extension('http://canshare.co.nz/fhir/StructureDefinition/an-last-admin-date').exists()"
Severity: #error
Description: "If the CarePlan was cancelled, then there must be the cancellation reason extension present"

