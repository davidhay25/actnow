Profile:        ObservationWeight
Parent:         Observation
Id:             an-weight
Title:          "Weight"
Description:    "An observation that represents a weight measurement"

* ^url = $weight
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^text.status = #additional
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>An observation that represents a weight measurement.</div>"

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
    loincCode 0..1              //this is the code from the Vitals IG

* code.coding[snomedCode].code = #27113001
* code.coding[snomedCode].system = $snomed

* code.coding[loincCode].code = #29463-7
* code.coding[loincCode].system = $loinc

* effective[x] only dateTime
* value[x] only Quantity
* identifier 1..*   //identifier required for updates

//todo - might want to use unit rather than code (but using code is better for analysis)...
* valueQuantity.code 1..1                 //make the quantity code required (but not the unit)
* valueQuantity.system 1..1     // todo - do we want to specify that the system is present? 
* valueQuantity.value 1..1          //there must be an actual value               

* valueQuantity.code = #kg               //must be kilograms
* valueQuantity.system = "http://unitsofmeasure.org"        //only accept UCUM codes

* obeys an-weight-1


Invariant: an-weight-1
Expression: "Observation.value > 20 and Observation.value < 400"
Severity: #warning
Description: "The weight must be between 20 and 400"
