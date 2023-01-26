Profile:        ObservationCN
Parent:         Observation
Id:             an-cN
Title:          "Clinical N-score"
Description:    "An observation that represents the clinical 'N' score which measures local lymph node involvement."

* ^url = $cN
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^text.status = #additional
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>An observation that represents the clinical 'N' score.</div>"

//required and must support elements
* subject 1..1 MS
* value[x] 1..1 MS
* status 1..1 MS
* code 1..1 MS

//Slice on the code. This states that at least the snomed code must be present - others are allowed though

* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "code"
* code.coding ^slicing.rules = #open

* code.coding contains
    snomedCode 1..1 and 
    mCode 0..1

* code.coding[snomedCode].code = #399534004 
* code.coding[snomedCode].system = $snomed

* code.coding[mCode].code = #21906-3
* code.coding[mCode].system = $loinc


* effective[x] only dateTime
* value[x] only CodeableConcept

