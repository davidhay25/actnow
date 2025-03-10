Profile:        ObservationPN
Parent:         Observation
Id:             an-pN
Title:          "Pathological N-score"
Description:    "An observation that represents the pathological 'N' score (pN) which measures local lymph node involvement."

* ^url = $pN
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^text.status = #additional
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>An observation that represents the pathological 'N' score (pN) which measures local lymph node involvement.</div>"

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

* code.coding[snomedCode].code = #371494008 
* code.coding[snomedCode].system = $snomed

* code.coding[mCode].code = #21900-6
* code.coding[mCode].system = $loinc


* effective[x] only dateTime
* value[x] only CodeableConcept

* valueCodeableConcept from https://nzhts.digital.health.nz/fhir/ValueSet/canshare-tnm-pn


ValueSet : PathN
Id: an-path-n
Title: "Pathological N score"
Description:  "Pathological N score"

* ^url = "https://nzhts.digital.health.nz/fhir/ValueSet/canshare-tnm-pn"
* ^experimental = false

* $snomed#1229947003 "pN0"
* $snomed#1229949000 "pN0(i+)"
* $snomed#1229950000 "pN0(mol+)"
* $snomed#1229948008 "pN0a"
* $snomed#1229951001 "pN1"
* $snomed#1229954009 "pN1a"
* $snomed#1229953003 "pN1a(sn)"
* $snomed#1229955005 "pN1b"
* $snomed#1229956006 "pN1c"
* $snomed#1229952008 "pN1mi"
* $snomed#1229957002 "pN2"
* $snomed#1229959004 "pN2a"
* $snomed#1229960009 "pN2b"
* $snomed#1229961008 "pN2c"
* $snomed#1229958007 "pN2mi"
* $snomed#1229962001 "pN3"
* $snomed#1229963006 "pN3a"
* $snomed#1229964000 "pN3b"
* $snomed#1229965004 "pN3c"
* $snomed#1229945006 "pNX"
