
//example of a completed cycle careplan

Instance: careplan-cycle-1
InstanceOf: $profCarePlan-cycle
Description: "Example of a cycle care plan"

* identifier.system = $identifierSystem
* identifier.value = "abc"

* title = "Cycle 1"

//this is the first cycle in the regimen
* extension[+].url = $extCycleNumber
* extension[=].valueInteger = 1

//the last medication administration.
* extension[+].url = $extLastAdminDate
* extension[=].valueDateTime = "2022-01-02"

* subject = Reference(exPatient)
* partOf = Reference(careplan-regimen-1)

* status = #completed
* intent = #plan


* category = $unknownSystem#cycleCP






