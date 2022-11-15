/**

measures the impact that the cancer has on the patient
0 -> 5 - fully active -> dead
https://ecog-acrin.org/resources/ecog-performance-status/

*/



Profile:        ObservationEcog
Parent:         Observation
Id:             an-ecog
Title:          "ECOG score"
Description:    "An observation that represents an ecog score"

* ^url = $ecog
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^text.status = #additional
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>An observation that represents an ecog score.</div>"

//required and must support elements
* subject 1..1 MS
* value[x] 1..1 MS
* status 1..1 MS
* code 1..1 MS
* identifier 1..*   //identifier required for updates

//Slice on the code
* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "code"
* code.coding ^slicing.rules = #closed

* code.coding contains
    snomedCode 1..1 and 
    mCode 0..1

* code.coding[snomedCode].code = #2643255014
* code.coding[snomedCode].display = "ECOG performance status"
* code.coding[snomedCode].system = $snomed

* code.coding[mCode].code = #89247-1 
* code.coding[mCode].system = $loinc


* effective[x] only dateTime

* value[x] only CodeableConcept         //range from 0 to 5
* valueCodeableConcept from $ecog-status-vs (required)


