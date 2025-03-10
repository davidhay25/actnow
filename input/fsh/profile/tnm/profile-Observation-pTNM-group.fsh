Profile:        ObservationPathTNMGroup
Parent:         Observation
Id:             an-pGroup
Title:          "Pathological TNM group score"
Description:    "An observation that represents the pathological TNM (pTNM) group score"

* ^url = $pGroup
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^text.status = #additional
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>An observation that represents the pathological TNM (pTNM) group score.</div>"

//required and must support elements
* subject 1..1 MS
* value[x] 1..1 MS
* status 1..1 MS
* code 1..1 MS

//Slice on the code. This states that at least the snomed code must be present - others are allowed though

* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open

* code.coding contains
    snomedCode 1..1 and 
    mCode 0..1

* code.coding[snomedCode].code = #399588009 
* code.coding[snomedCode].system = $snomed

* code.coding[mCode].code = #21902-2 
* code.coding[mCode].system = $loinc


* effective[x] only dateTime
* value[x] only CodeableConcept

* hasMember only Reference(ObservationPT or ObservationPN or ObservationPM)

* valueCodeableConcept from https://nzhts.digital.health.nz/fhir/ValueSet/canshare-tnm-pathological-stage-group


ValueSet : PathTNMGroup
Id: an-path-tnmgroup
Title: "Pathological TNM group"
Description:  "The TNM group score"

* ^url = "https://nzhts.digital.health.nz/fhir/ValueSet/canshare-tnm-pathological-stage-group"
* ^experimental = false

* $snomed#1222605001 "0"
* $snomed#1222721004 "0a"
* $snomed#1222722006 "0is"
* $snomed#1222723001 "I"
* $snomed#1222724007 "IA"
* $snomed#1222725008 "IA1"
* $snomed#1222726009 "IA2"
* $snomed#1222727000 "IA3"
* $snomed#1222728005 "IB"
* $snomed#1222729002 "IB1"
* $snomed#1222730007 "IB2"
* $snomed#1222731006 "IC"
* $snomed#1222732004 "IE"
* $snomed#1222765007 "II"
* $snomed#1222772008 "II bulky"
* $snomed#1222766008 "IIA"
* $snomed#1222767004 "IIA1"
* $snomed#1222768009 "IIA2"
* $snomed#1222769001 "IIB"
* $snomed#1222770000 "IIC"
* $snomed#1222771001 "IIE"
* $snomed#1222801008 "III"
* $snomed#1222802001 "IIIA"
* $snomed#1222803006 "IIIA1"
* $snomed#1222804000 "IIIA2"
* $snomed#1222805004 "IIIB"
* $snomed#1222806003 "IIIC"
* $snomed#1222807007 "IIIC1"
* $snomed#1222809005 "IIIC2"
* $snomed#1222811001 "IIID"
* $snomed#1222733009 "IS"
* $snomed#1222837003 "IV"
* $snomed#1222838008 "IVA"
* $snomed#1222841004 "IVB"
* $snomed#1222842006 "IVC"