//An example of a regimen outcome

//the outcome was that the regimen was discontinued due to patient intolerance

Instance: ex-regimen-outcome-1
InstanceOf: ObservationRegimenOutcome
Description: "First bundle of scenario 1"

//the status of the Observation is 'completed' - the regimen careplan status will be 'revoked'
* status = #final
* subject = Reference(exPatient)
* effectiveDateTime = "2020-01-01"

* code = $unknownSystem#regimen-outcome

//the regimen plan that this outcome measures
* basedOn = Reference(careplan-regimen-1)

//the number of cycles completed for this regimen CP
* extension[+].url = $extCycleCount
* extension[=].valueInteger = 10

//the extension details about why the regimen was discontinued
* extension[+].url = $extRegimenDiscontinued
* extension[=].extension[+].url = "patientfactors"
* extension[=].extension[=].valueCodeableConcept = $regimen-discontinued-patient-factors-cs#cost

* extension[=].extension[+].url = "reason"
* extension[=].extension[=].valueCodeableConcept = $regimen-discontinued-reason-cs#pf

* extension[=].extension[+].url = "toxicity"
* extension[=].extension[=].valueCodeableConcept = $regimen-discontinued-toxicity-cs#nausea

//the OTU scores 
* extension[+].url = $extRegimenOTU
* extension[=].extension[+].url = "benefit"
* extension[=].extension[=].valueInteger = 1

* extension[=].extension[+].url = "acceptable"
* extension[=].extension[=].valueInteger = 1


//todo - what is the actual value of a regimen outcome? (outside of the extensions)
//??? the overall 
* valueCodeableConcept = $regimen-outcome-cs#better

