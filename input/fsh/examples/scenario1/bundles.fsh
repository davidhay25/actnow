//the bundle representing the first bundle submitted

Instance: scen1-bundle-1
InstanceOf: Bundle
Description: "First bundle of scenario 1"
* type = #collection

* entry[+].resource = scen1-patient         //the patient
* entry[+].resource = scen1-regimen-plan-v1            //the regimen plan
* entry[+].resource = scen1-cycle-plan1-v1            //the cycle plan