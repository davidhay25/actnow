

Profile:        ObservationHer2Status
Parent:         Observation
Id:             an-her2-status
Title:          "HER2 status"
Description:    "An observation that represents a human epidermal growth factor receptor 2 (HER2) status"

* ^url = $her2-status
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^text.status = #additional
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>An observation that represents a human epidermal growth factor receptor 2 (HER2) status.</div>"

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

* code.coding[snomedCode].code = #476171000210109
* code.coding[snomedCode].system = $snomed

* value[x] only CodeableConcept
* valueCodeableConcept from $her2-status-vs (required)




