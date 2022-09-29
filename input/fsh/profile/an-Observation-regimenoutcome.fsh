//the value of the observation is the overall 'success' of the regimen - the OTU score

Profile:        ObservationRegimenOutcome
Parent:         Observation
Id:             an-regimen-outcome
Title:          "Regimen outcome"
Description:    "An observation that represents the outcome of a regimen CarePlan that is closed"

* ^url = $regimen-outcome
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

//required and must support
* subject 1..1 MS

//extensions
* extension contains
    $extCycleCount named cycle-count 0..1 MS and
    $extRegimenDiscontinued named regimen-discontinued 0..1 MS and
    $extRegimenOTU named otu 0..1 MS

* extension[cycle-count] ^short = "The number of treatment cycles administered under this regimen"
* extension[regimen-discontinued] ^short = "The reason the regimen was discontinued"
* extension[otu] ^short = "Benefit and Acceptable OTU (overall OTU is value of Observation"

//the date the observation was made
* effective[x] 1..1 MS
* effective[x] only dateTime   

//The observation must have a basedOn to a CarePlan of type regimen
* basedOn 1..1 MS   
* basedOn only Reference(CareplanRegimen)  

//fix the code value
* code = http://unknown.com#regimenoutcome

//fix the value type
//* value[x] only integer     
