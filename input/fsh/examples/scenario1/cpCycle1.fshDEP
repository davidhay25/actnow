//---- First version of first cycle --------
//The first cycle of treatment - ie multiple medication administrations and potentially observatopns
//Modelled as a CarePlan with a 'partOf' reference to the regimen careplan
//Created before the first cycle commences - must be after the regiman cp has been created
Instance: scen1-cycle-plan1-v1
InstanceOf: CarePlan
Title: "First cycle of treatment"
Usage: #example
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Cycle1</div>"
* text.status = #generated

* title = "First cycle of treatment"
* identifier.system = "http://canshare.co.nz/NamingSystem/cpCycle"
* identifier.value = "scen1-cycle1"
* category = http://canshare.co.nz#cycleCP
* subject = Reference(scen1-patient)
//* author = Reference(an-practitioner)
* category = http://canshare.com#cycleCP

* status = #active
* intent = #plan
* period.start = "2020-01-01"
* period.end = "2020-02-01"
* partOf = Reference(scen1-regimen-plan-v1)


Instance: scen1-cycle-plan1-v2
InstanceOf: CarePlan
Title: "First cycle of treatment"
Usage: #example
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Cycle1</div>"
* text.status = #generated

* title = "First cycle of treatment"
* identifier.system = "http://canshare.co.nz/NamingSystem/cpCycle"
* identifier.value = "scen1-cycle1"
* category = http://canshare.co.nz#cycleCP
* subject = Reference(scen1-patient)
//* author = Reference(an-practitioner)
* category = http://canshare.com#cycleCP

* status = #completed
* intent = #plan
* period.start = "2020-01-01"
* period.end = "2020-02-01"
* partOf = Reference(scen1-regimen-plan-v1)