Profile:        ObservationGleason
Parent:         Observation
Id:             an-gleason
Title:          "Gleason score"
Description:    "An observation that represents the Gleason score"

* ^url = $gleason
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^text.status = #additional
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>An observation that represents the Gleason score.</div>"

//required and must support elements
* subject 1..1 MS


//The actual values are found in the components so there's no value to the Observation itself.
* value[x] 0..0 MS

// create a slicing for the snomed code
* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "code"
* code.coding ^slicing.rules = #open

* code.coding contains
    snomedCode 1..1 

* code.coding[snomedCode].code = #372278000
* code.coding[snomedCode].display = "Gleason score (observable entity)"
* code.coding[snomedCode].system = $snomed


// code 372278000 (Gleason score)
//Slice on the component. Allow the primary, secondary and tertiary scores 

* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.description = "Slice based on the component.code pattern"

* component contains
    primary 1..1 and    //384994009
    secondary 0..1 and  //384995005
    tertiary 0..1       //385002007

* component[primary].code = $snomed#384994009 
* component[primary].value[x] only integer


* component[secondary].code = $snomed#384995005
* component[secondary].value[x] only integer

* component[tertiary].code = $snomed#385002007
* component[tertiary].value[x] only integer
