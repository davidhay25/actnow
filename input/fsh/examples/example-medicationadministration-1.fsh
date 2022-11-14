Instance: medicationadministration-1
InstanceOf: AnMedicationAdministration
Description: "An example medication administration"


* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Oxaliplatin260.00 mg IV</div>"
* text.status = #generated

* subject = Reference(exPatient)

* identifier.system = $identifierSystem
* identifier.value = "ma-1"

* performer.function = $performer-function#performer
* performer.actor.reference = "hpiOfFacility" 

//the reference to the cycle careplan
* supportingInformation[+] = Reference(careplan-cycle-1)

* status = #completed
* medicationCodeableConcept.text = "Oxaliplatin"

* effectivePeriod.start = "2014-04-08T09:35:00Z"
* effectivePeriod.end = "2014-04-08T12:00:00Z"

* dosage.text = "260.00 mg"
* dosage.route.text = "IV"

//dosage.dose is required by the validator...
* dosage.dose.value = 260.00
* dosage.dose.unit = "mg"

* extension[+].url = $extCycleDay
* extension[=].extension[+].url = "planned"
* extension[=].extension[=].valueInteger = 3            //planned to be given on the 3rd day of the cycle
* extension[=].extension[+].url = "administered"
* extension[=].extension[=].valueInteger = 4            //actually given on the 4th day

* extension[+].url = $extPrescribedDose
* extension[=].valueDosage.text = "300 mg"

* extension[+].url = $extDoseAdjustmentReason
* extension[=].valueCodeableConcept = $dose-adjustment-reason-cs#intol



