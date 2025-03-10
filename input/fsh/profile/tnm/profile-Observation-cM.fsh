Profile:        ObservationCM
Parent:         Observation
Id:             an-cM
Title:          "Clinical M-score"
Description:    "An observation that represents the clinical 'M' score which measures metastases and spread."

* ^url = $cM
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^text.status = #additional
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>An observation that represents the clinical 'M' score which measures metastases and spread.</div>"

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
    mCode 0..1                  //the code defined in mcode

* code.coding[snomedCode].code = #399387003 
* code.coding[snomedCode].system = $snomed

* code.coding[mCode].code = #21907-1
* code.coding[mCode].system = $loinc

* effective[x] only dateTime
* value[x] only CodeableConcept
* valueCodeableConcept from https://nzhts.digital.health.nz/fhir/ValueSet/canshare-tnm-cm



ValueSet : AnCM
Id: an-tnm-cm
Title: "Clinical M score"
Description:  "The TNM group score"

* ^url = "https://nzhts.digital.health.nz/fhir/ValueSet/canshare-tnm-cm"
* ^experimental = false

* $snomed#1229901006 "cM0"
* $snomed#1229902004 "cM0(i+)"
* $snomed#1229903009 "cM1"
* $snomed#1229904003 "cM1a"
* $snomed#1229905002 "cM1a(0)"
* $snomed#1229906001 "cM1a(1)"
* $snomed#1229907005 "cM1b"
* $snomed#1229908000 "cM1b(0)"
* $snomed#1229909008 "cM1b(1)"
* $snomed#1229910003 "cM1c"
* $snomed#1229911004 "cM1c(0)"
* $snomed#1229912006 "cM1c(1)"
* $snomed#1229913001 "cM1d"
* $snomed#1229914007 "cM1d(0)"
* $snomed#1229915008 "cM1d(1)"

