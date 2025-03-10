Profile:        ObservationPT
Parent:         Observation
Id:             an-pT
Title:          "Pathological T-score"
Description:    "An observation that represents the pathological 'T' score (pT) which measures tumour size"

* ^url = $pT
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^text.status = #additional
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>An observation that represents the pathological 'T' score (pT) which measures tumour size.</div>"

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

* code.coding[snomedCode].code = #384625004 
* code.coding[snomedCode].system = $snomed

* code.coding[mCode].code = #21899-0 
* code.coding[mCode].system = $loinc

* effective[x] only dateTime
* value[x] only CodeableConcept

* valueCodeableConcept from https://nzhts.digital.health.nz/fhir/ValueSet/canshare-tnm-pt


ValueSet : PathT
Id: an-path-t
Title: "Pathological T score"
Description:  "Pathological T score"

* ^url = "https://nzhts.digital.health.nz/fhir/ValueSet/canshare-tnm-pt"
* ^experimental = false

* $snomed#1228951007 "pT0"
* $snomed#1228957006 "pT1"
* $snomed#1228959009 "pT1a"
* $snomed#1228960004 "pT1a1"
* $snomed#1228961000 "pT1a2"
* $snomed#1228962007 "pT1b"
* $snomed#1229844006 "pT1b1"
* $snomed#1229845007 "pT1b2"
* $snomed#1285095005 "pT1b3"
* $snomed#1229846008 "pT1c"
* $snomed#1229848009 "pT1c1"
* $snomed#1229849001 "pT1c2"
* $snomed#1229850001 "pT1c3"
* $snomed#1229851002 "pT1d"
* $snomed#1228958001 "pT1mi"
* $snomed#1229852009 "pT2"
* $snomed#1229853004 "pT2a"
* $snomed#1229854005 "pT2a1"
* $snomed#1229855006 "pT2a2"
* $snomed#1229856007 "pT2b"
* $snomed#1229857003 "pT2c"
* $snomed#1229858008 "pT2d"
* $snomed#1229859000 "pT3"
* $snomed#1229860005 "pT3a"
* $snomed#1229861009 "pT3b"
* $snomed#1229862002 "pT3c"
* $snomed#1229863007 "pT3d"
* $snomed#1229864001 "pT4"
* $snomed#1229865000 "pT4a"
* $snomed#1229866004 "pT4b"
* $snomed#1229867008 "pT4c"
* $snomed#1229868003 "pT4d"
* $snomed#1229869006 "pT4e"
* $snomed#1228952000 "pTa"
* $snomed#1228953005 "pTis"
* $snomed#1228954004 "pTis(DCIS)"
* $snomed#1228955003 "pTis(LAMN)"
* $snomed#1228956002 "pTis(Paget)"
* $snomed#1228950008 "pTX"
