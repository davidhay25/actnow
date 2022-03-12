Instance: ma-basedOn
InstanceOf: SearchParameter 
Description: "based-on extension for MedicationAdmin -> CarePlan"

* url = "http://canshare.com/ma-based-on"
* name = "mabasedon"
* status = #active
* description = "MedicationAdministration based-on reference to CarePlan"
* code = #ma-based-on
* base = #MedicationAdministration
* type = #reference
* expression = "MedicationAdministration.extension('http://clinfhir.com/StructureDefinition/based-on')"
* target = #CarePlan