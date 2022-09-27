Profile:        ObservationBSA
Parent:         Observation
Id:             observation-bsa
Title:          "Body Surface Area"
Description:    "An observation that represents a Body Surface Area measurement"

* ^url = $bsa
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^text.status = #additional
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>An observation that represents a Body Surface Area measurement.</div>"

//required and must support elements
* subject 1..1 MS
* value[x] 1..1 MS
* status 1..1 MS
* code 1..1 MS

//fix the code value

* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "code"
* code.coding ^slicing.rules = #open

* code.coding contains
    fixedCode 1..1

* code.coding[fixedCode].code = #443403011
* code.coding[fixedCode].system = $snomed

//* code = $snomed#443403011 // don't include the description here, otherise it is required ..."Body surface area (observable entity)"

* effective[x] only dateTime

* value[x] only Quantity

