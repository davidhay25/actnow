// systems
Alias: $snomed = http://snomed.info/sct
Alias: $loinc = http://loinc.org
Alias: $actnow = http://canshare.co.nz/fhir/

//Aliases for profiles
Alias: $profCondition = http://canshare.co.nz/fhir/StructureDefinition/actnow-condition
Alias: $profPatient = http://canshare.co.nz/fhir/StructureDefinition/actnow-condition
Alias: $profMedicationAdministration = http://canshare.co.nz/fhir/StructureDefinition/actnow-medication-administration

Alias: $profCarePlan-patient = http://canshare.co.nz/fhir/StructureDefinition/actnow-careplan-patient
Alias: $profCarePlan-regimen = http://canshare.co.nz/fhir/StructureDefinition/actnow-careplan-regimen
Alias: $profCarePlan-cycle = http://canshare.co.nz/fhir/StructureDefinition/actnow-careplan-cycle

Alias: $ecog = http://canshare.co.nz/fhir/StructureDefinition/observation-ecog
Alias: $bsa = http://canshare.co.nz/fhir/StructureDefinition/observation-bsa
Alias: $regimen-outcome = http://canshare.co.nz/fhir/StructureDefinition/observation-regimen-outcome

//Aliases for TNM
Alias: $cT = http://canshare.co.nz/fhir/StructureDefinition/cT
Alias: $cN = http://canshare.co.nz/fhir/StructureDefinition/cN
Alias: $cM = http://canshare.co.nz/fhir/StructureDefinition/cM
Alias: $cGroup = http://canshare.co.nz/fhir/StructureDefinition/cGroup

Alias: $pT = http://canshare.co.nz/fhir/StructureDefinition/pT
Alias: $pN = http://canshare.co.nz/fhir/StructureDefinition/pN
Alias: $pM = http://canshare.co.nz/fhir/StructureDefinition/pM
Alias: $pGroup = http://canshare.co.nz/fhir/StructureDefinition/pGroup


//Aliases for extensions
Alias: $iot = http://canshare.co.nz/fhir/StructureDefinition/intent-of-treatment
Alias: $clinicalTrial = http://canshare.co.nz/fhir/StructureDefinition/clinicalTrial
Alias: $extCycleCount = http://canshare.co.nz/fhir/StructureDefinition/cycle-count

Alias: $extLastAdminDate = http://canshare.co.nz/fhir/StructureDefinition/last-admin-date


Alias: $extPlannedDose = http://canshare.co.nz/fhir/StructureDefinition/planned-dose

Alias: $extRegimenDiscontinued = http://canshare.co.nz/fhir/StructureDefinition/regimen-discontinued
Alias: $extRegimenOTU = http://canshare.co.nz/fhir/StructureDefinition/regimen-otu
Alias: $extCycleNumber = http://canshare.co.nz/fhir/StructureDefinition/cycle-number
Alias: $extBasedOn = http://canshare.co.nz/fhir/StructureDefinition/based-on
Alias: $extCycleDay = http://canshare.co.nz/fhir/StructureDefinition/cycle-day
Alias: $extPrescribedDose = http://canshare.co.nz/fhir/StructureDefinition/prescribed-dose
Alias: $extDoseAdjustmentReason = http://canshare.co.nz/fhir/StructureDefinition/dose-adjustment-reason


//ValueSet & Codesystem urls
//note that all codesystems will become snomed eventually...
Alias: $regimen-discontinued-reason-vs = http://canshare.co.nz/fhir/ValueSet/regimen-discontinued-reason-vs
Alias: $regimen-discontinued-reason-cs = http://canshare.co.nz/fhir/CodeSystem/regimen-discontinued-reason-vs

Alias: $regimen-discontinued-patient-factors-vs = http://canshare.co.nz/fhir/ValueSet/regimen-discontinued-patient-factors-vs
Alias: $regimen-discontinued-patient-factors-cs = http://canshare.co.nz/fhir/CodeSystem/regimen-discontinued-patient-factors-cs

Alias: $regimen-discontinued-toxicity-vs = http://canshare.co.nz/fhir/ValueSet/regimen-discontinued-toxicity-vs
Alias: $regimen-discontinued-toxicity-cs = http://canshare.co.nz/fhir/CodeSystem/regimen-discontinued-toxicity-cs