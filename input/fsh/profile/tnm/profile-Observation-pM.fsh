Profile:        ObservationPM
Parent:         Observation
Id:             an-pM
Title:          "Pathological M-score"
Description:    "An observation that represents the pathological 'M' score (pM) which measures distant metastases"

* ^url = $pM
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^text.status = #additional
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>An observation that represents the pathological 'M' score (pM) which measures distant metastases.</div>"

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

* code.coding[snomedCode].code = #371497001 
* code.coding[snomedCode].system = $snomed

* code.coding[mCode].code = #21901-4 
* code.coding[mCode].system = $loinc


* effective[x] only dateTime
* value[x] only CodeableConcept

* valueCodeableConcept from https://nzhts.digital.health.nz/fhir/ValueSet/canshare-tnm-pm


ValueSet : PathM
Id: an-path-m
Title: "Pathological M score"
Description:  "Pathological M score"

* ^url = "https://nzhts.digital.health.nz/fhir/ValueSet/canshare-tnm-pm"
* ^experimental = false

* $snomed#1229916009 "pM1"
* $snomed#1229917000 "pM1a"
* $snomed#1229918005 "pM1a(0)"
* $snomed#1229919002 "pM1a(1)"
* $snomed#1229920008 "pM1b"
* $snomed#1229921007 "pM1b(0)"
* $snomed#1229922000 "pM1b(1)"
* $snomed#1229923005 "pM1c"
* $snomed#1229924004 "pM1c(0)"
* $snomed#1229925003 "pM1c(1)"
* $snomed#1229926002 "pM1d"
* $snomed#1229927006 "pM1d(0)"
* $snomed#1229928001 "pM1d(1)"