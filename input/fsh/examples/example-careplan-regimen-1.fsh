
//example of a completed regimen careplan

Instance: careplan-regimen-1
InstanceOf: $profCarePlan-regimen
Description: "Example of a regimen care plan"

* identifier.system = $identifierSystem
* identifier.value = "abc"

* subject = Reference(exPatient)

* status = #completed
* intent = #plan

* category = $unknownSystem#regimenCP

//intent of treatment
* extension[+].url = $iot
* extension[=].valueCodeableConcept = $regimen-iot-cs#palliative

//is on a clinical trial
* extension[+].url = $clinicalTrial
* extension[=].valueBoolean = true

//regimen is a folfox
* extension[+].url = $regimen-type
* extension[=].valueCodeableConcept.text = "FOLFOX"
//-----------------------------------------------
//a careplan that was cancelled (status = revoked). It needs the cancellation reasons.
Instance: careplan-regimen-2
InstanceOf: $profCarePlan-regimen
Description: "A regimen care plan that was discontinued after it started"

* identifier.system = $identifierSystem
* identifier.value = "abc"

* subject = Reference(exPatient)

* status = #revoked
* intent = #plan

* category = $unknownSystem#regimenCP

//the number of cycles completed for this regimen CP
* extension[+].url = $extCycleCount
* extension[=].valueInteger = 10

//the OTU scores 
* extension[+].url = $extRegimenOTU
* extension[=].extension[+].url = "benefit"
* extension[=].extension[=].valueInteger = 1

* extension[=].extension[+].url = "acceptable"
* extension[=].extension[=].valueInteger = 1

//the extension details about why the regimen was discontinued
* extension[+].url = $extRegimenDiscontinued
* extension[=].extension[+].url = "patientfactors"
* extension[=].extension[=].valueCodeableConcept = $regimen-discontinued-patient-factors-cs#cost

* extension[=].extension[+].url = "reason"
* extension[=].extension[=].valueCodeableConcept = $regimen-discontinued-reason-cs#pf

* extension[=].extension[+].url = "toxicity"
* extension[=].extension[=].valueCodeableConcept = $regimen-discontinued-toxicity-cs#nausea






