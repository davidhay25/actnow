
//example of a completed regimen careplan

Instance: careplan-regimen-1
InstanceOf: $profCarePlan-regimen
Description: "Example of a regimen care plan"

* meta.profile = $profCarePlan-regimen

* identifier.system = $identifierSystem
* identifier.value = "abc"

* subject = Reference(exPatient)

* status = #completed
* intent = #plan

* category = $unknownSystem#regimenCP

//intent of treatment
* extension[+].url = $iot
* extension[=].valueCodeableConcept =  $snomed#373846009 "Curative Adjuvant"

//is on a clinical trial
* extension[+].url = $clinicalTrial
* extension[=].valueBoolean = true

//regimen is a folfox
* extension[+].url = $regimen-type
* extension[=].valueCodeableConcept = https://standards.digital.health.nz/ns/sact-regimen-code#FOLFOX6

//course number is 3
* extension[+].url = $extCourseNumber
* extension[=].valueInteger = 3


* period.start = "2012-01-01"
* period.end = "2012-01-01"

//-----------------------------------------------
//a careplan that was cancelled (status = revoked). It needs the cancellation reasons.
Instance: careplan-regimen-2
InstanceOf: $profCarePlan-regimen
Description: "A regimen care plan that was discontinued after it started"

* meta.profile = $profCarePlan-regimen

* identifier.system = $identifierSystem
* identifier.value = "abc"

* subject = Reference(exPatient)

* status = #revoked
* intent = #plan

* category = $unknownSystem#regimenCP

//the number of cycles completed for this regimen CP
* extension[+].url = $extCycleCount
* extension[=].valueInteger = 10

//Intent of treatment
* extension[+].url = $iot
* extension[=].valueCodeableConcept = $snomed#373808002 "Curative"

//regimen is a folfox
* extension[+].url = $regimen-type
* extension[=].valueCodeableConcept = https://standards.digital.health.nz/ns/sact-regimen-code#FOLFOX6


//the OTU scores 
* extension[+].url = $extRegimenOTU
* extension[=].extension[+].url = "benefit"
* extension[=].extension[=].valueInteger = 1

* extension[=].extension[+].url = "acceptable"
* extension[=].extension[=].valueInteger = 1

//the extension details about why the regimen was discontinued

* extension[+].url = $extRegimenDiscontinued
* extension[=].extension[+].url = "patientfactors"
* extension[=].extension[=].valueCodeableConcept = $snomed#182872003 "Drug discontinued - too expensive (situation)"

* extension[=].extension[+].url = "reason"
* extension[=].extension[=].valueCodeableConcept = $regimen-discontinued-reason-cs#pf

* extension[=].extension[+].url = "toxicity"
* extension[=].extension[=].valueCodeableConcept = $regimen-discontinued-toxicity-cs#nausea




* period.start = "2012-01-01"
* period.end = "2012-01-01"

/*

//should be an error
Instance: careplan-regimen-error
InstanceOf: $profCarePlan-regimen
Description: "Example of a regimen care plan"

* meta.profile = $profCarePlan-regimen

* identifier.system = $identifierSystem
* identifier.value = "abc"

* subject = Reference(exPatient)

* status = #completed
* intent = #plan

//* category = $unknownSystem#regimenCP

//intent of treatment
* extension[+].url = $iot
* extension[=].valueCodeableConcept = $regimen-iot-cs#palliative

//is on a clinical trial
* extension[+].url = $clinicalTrial
* extension[=].valueBoolean = true

//regimen is a folfox
* extension[+].url = $regimen-type
* extension[=].valueCodeableConcept.text = "FOLFOX"


*/