Profile:        ObservationCT
Parent:         Observation
Id:             an-cT
Title:          "Clinical T-score"
Description:    "An observation that represents the clinical 'T' score which measures the tumour size."

* ^url = $cT
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^text.status = #additional
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>An observation that represents the clinical 'T' score.</div>"

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

* code.coding[snomedCode].code = #399504009
* code.coding[snomedCode].system = $snomed

* code.coding[mCode].code = #21905-5
* code.coding[mCode].system = $loinc

* effective[x] only dateTime
* value[x] only CodeableConcept
* valueCodeableConcept from https://nzhts.digital.health.nz/fhir/ValueSet/canshare-tnm-ct



ValueSet : AnCT
Id: an-tnm-ct
Title: "Clinical T score"
Description:  "The clinical T score"

* ^url = "https://nzhts.digital.health.nz/fhir/ValueSet/canshare-tnm-ct"
* ^experimental = false

* $snomed#1228882005 "cT0"
* $snomed#1228889001 "cT1"
* $snomed#1228892002 "cT1a"
* $snomed#1228893007 "cT1a1"
* $snomed#1228894001 "cT1a2"
* $snomed#1228895000 "cT1b"
* $snomed#1228896004 "cT1b1"
* $snomed#1228898003 "cT1b2"
* $snomed#1228899006 "cT1c"
* $snomed#1228900001 "cT1c1"
* $snomed#1228901002 "cT1c2"
* $snomed#1228902009 "cT1c3"
* $snomed#1228928007 "cT1d"
* $snomed#1228891009 "cT1mi"
* $snomed#1228929004 "cT2"
* $snomed#1228931008 "cT2a"
* $snomed#1228932001 "cT2a1"
* $snomed#1228933006 "cT2a2"
* $snomed#1228934000 "cT2b"
* $snomed#1228936003 "cT2c"
* $snomed#1228937007 "cT2d"
* $snomed#1228938002 "cT3"
* $snomed#1228939005 "cT3a"
* $snomed#1228940007 "cT3b"
* $snomed#1228941006 "cT3c"
* $snomed#1228942004 "cT3d"
* $snomed#1228943009 "cT3e"
* $snomed#1228944003 "cT4"
* $snomed#1228945002 "cT4a"
* $snomed#1228946001 "cT4b"
* $snomed#1228947005 "cT4c"
* $snomed#1228948000 "cT4d"
* $snomed#1228949008 "cT4e"
* $snomed#1228883000 "cTa"
* $snomed#1228884006 "cTis"
* $snomed#1228885007 "cTis(DCIS)"
* $snomed#1228887004 "cTis(LAMN)"
* $snomed#1228888009 "cTis(Paget)"
* $snomed#1222604002 "cTX"