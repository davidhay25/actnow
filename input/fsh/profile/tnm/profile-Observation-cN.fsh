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

* valueCodeableConcept from https://nzhts.digital.health.nz/fhir/ValueSet/canshare-tnm-cn



ValueSet : AnCN
Id: an-tnm-cn
Title: "Clinical N score"
Description:  "The clincial N score"

* ^url = "https://nzhts.digital.health.nz/fhir/ValueSet/canshare-tnm-cn"
* ^experimental = false


* $snomed#1229967007 "cN0"
* $snomed#1229971005 "cN0(i+)"
* $snomed#1229968002 "cN0a"
* $snomed#1229969005 "cN0b"
* $snomed#1229973008 "cN1"
* $snomed#1229975001 "cN1a"
* $snomed#1229976000 "cN1b"
* $snomed#1229977009 "cN1c"
* $snomed#1229974002 "cN1mi"
* $snomed#1229978004 "cN2"
* $snomed#1229981009 "cN2a"
* $snomed#1229982002 "cN2b"
* $snomed#1229983007 "cN2c"
* $snomed#1229980005 "cN2mi"
* $snomed#1229984001 "cN3"
* $snomed#1229985000 "cN3a"
* $snomed#1229986004 "cN3b"
* $snomed#1229987008 "cN3c"
* $snomed#1229966003 "cNX"