Profile:        ObservationHeight
Parent:         Observation
Id:             an-height
Title:          "Height"
Description:    "An observation that represents a height measurement"

* ^url = $height
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^text.status = #additional
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>An observation that represents a height measurement.</div>"

//required and must support elements
* subject 1..1 MS
* value[x] 1..1 MS
* status 1..1 MS
* code 1..1 MS
* identifier 1..*   //identifier required for updates



//Slice on the code. This states that at least the snomed code must be present - others are allowed though

* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "code"
* code.coding ^slicing.rules = #open

* code.coding contains
    snomedCode 1..1 and
    loincCode 0..1

* code.coding[snomedCode].code = #1153637007
* code.coding[snomedCode].system = $snomed

* code.coding[loincCode].code = #8302-2
* code.coding[loincCode].system = $loinc

* effective[x] only dateTime
* value[x] only Quantity

* valueQuantity.code = #cm        //must be in centimetresmetres
* valueQuantity.system = "http://unitsofmeasure.org"

/*
* valueQuantity ^minValueQuantity.value = 1          //assume that no person will be less than 1 metre
* valueQuantity ^minValueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity ^minValueQuantity.code = #m  

* valueQuantity ^maxValueQuantity.value = 2.5          //assume that no person will be greater  2.5 m
* valueQuantity ^maxValueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity ^maxValueQuantity.code = #m
*/
* obeys an-height-1



Invariant: an-height-1
Expression: "Observation.valueQuantity.value >= 50 and Observation.valueQuantity.value < 220"
Severity: #warning
Description: "The weight must be between 50 and 220  centimetres"