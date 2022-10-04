
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

//there were 5 cycles - on the outcome observation 
//* extension[+].url = $extCycleCount
//* extension[=].valueInteger = 5



/*$iot  named iot 0..1 and                //intent of treatment
    $clinicalTrial named clinicalTrial 0..1  and //is part of a clinical trial
    $extRegimenDiscontinued named reasonDiscontinued 0..1 and //If the regimen was discontinued
    $extCycleCount named CycleCount 0..1 //The number of cycles administered under this regimen*/




