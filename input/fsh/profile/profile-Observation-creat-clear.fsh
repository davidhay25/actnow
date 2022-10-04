Profile:        ObservationCreatClear
Parent:         Observation
Id:             an-creat-clear
Title:          "Creatinine Clearance"
Description:    "An observation that represents a Creatinine Clearance measurement"

* ^url = $creat-clear
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^text.status = #additional
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>An observation that represents a Creatinine Clearance measurement.</div>"

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
    snomedCode 1..1

* code.coding[snomedCode].code = #cc
* code.coding[snomedCode].system = "www.example.org"

* effective[x] only dateTime
* value[x] only Quantity

