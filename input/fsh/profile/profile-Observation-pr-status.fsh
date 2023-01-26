


Profile:        ObservationPrStatus
Parent:         Observation
Id:             an-pr-status
Title:          "PR status"
Description:    "An observation that represents a Progesterone Receptor status"

* ^url = $pr-status
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^text.status = #additional
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>An observation that represents an PR status.</div>"

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

* code.coding[snomedCode].code = #445029000
* code.coding[snomedCode].system = $snomed

* value[x] only CodeableConcept
* valueCodeableConcept from $pr-status-vs (required)




