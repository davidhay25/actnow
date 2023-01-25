/**

measures the impact that the cancer has on the patient
0 -> 5 - fully active -> dead
https://ecog-acrin.org/resources/ecog-performance-status/

*/



Profile:        ObservationErStatus
Parent:         Observation
Id:             an-er-status
Title:          "Estrogen Receptor status"
Description:    "An observation that represents an ER status"

* ^url = $er-status
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^text.status = #additional
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>An observation that represents an ER status.</div>"

//required and must support elements
* subject 1..1 MS
* value[x] 1..1 MS
* status 1..1 MS
* code 1..1 MS

//Slice on the code
* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "code"
* code.coding ^slicing.rules = #open

* code.coding contains
    snomedCode 1..1 

* code.coding[snomedCode].code = #253331000210104
* code.coding[snomedCode].system = $snomed

* value[x] only CodeableConcept
* valueCodeableConcept from $er-status-vs (required)




