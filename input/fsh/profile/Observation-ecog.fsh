Profile:        ObservationEcog
Parent:         Observation
Id:             observation-ecog
Title:          "ECOG score"
Description:    "An observation that represents an ecog score"

* ^url = "http://canshare.com/fhir/StructureDefinition/observation-ecog"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^text.status = #additional
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>A CarePlan that represents a single cycle of treatment.</div>"

//required and must support elements
* subject 1..1 MS
* value[x] 1..1 MS
* status 1..1 MS
* code 1..1 MS

//fix the code value
* code = $loinc#89247-1

* effective[x] only dateTime

* value[x] only integer

