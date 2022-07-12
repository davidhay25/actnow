

Instance: scen1-regimen-plan-v1
InstanceOf: CarePlan
Title: "Regimen details"
Usage: #example
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Regimen</div>"
* text.status = #generated
* title = "Plan for regemen derived from: http://PlanDefinition/lungcancer1"
* subject = Reference(scen1-patient)
//* author = Reference(an-practitioner)
* status = #active
* intent = #plan
* instantiatesCanonical = "http://PlanDefinition/lungcancer1"
//* supportingInfo = Reference(ecog-regimen)
//* addresses = Reference(an-cancer)

* identifier.system = "http://canshare.co.nz/NamingSystem/cpRegimen"
* identifier.value = "scen1-regimen1"
* category = http://canshare.co.nz#regimenCP
//* careTeam = Reference(an-careteam)

//* supportingInfo[0] = Reference(cTNM)

//intent of treatment - not the same as the CarePlan.intent
* extension[+].url = $iot
* extension[=].valueCodeableConcept.text = "palliative"

//Is this regimen part of a clinical trial
* extension[+].url = $clinicalTrial
* extension[=].valueBoolean = false
