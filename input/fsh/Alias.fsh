//external aliases 

Alias: $regimen-type = http://hl7.org.nz/fhir/StructureDefinition/sact-regimen-type

Alias: $performer-function = http://terminology.hl7.org/CodeSystem/med-admin-perform-function

// systems
Alias: $snomed = http://snomed.info/sct/21000210109 
//Alias: $snomed = http://snomed.info/sct
Alias: $loinc = http://loinc.org
Alias: $unknownSystem = http://unknown.org

//identifier systems
Alias: $identifierSystem = http://canshare.co.nz/fhir/NamingSystem/1


//Aliases for profiles
Alias: $profCondition = http://canshare.co.nz/fhir/StructureDefinition/an-condition
Alias: $profPatient = http://canshare.co.nz/fhir/StructureDefinition/an-patient
Alias: $profMedicationAdministration = http://canshare.co.nz/fhir/StructureDefinition/an-medication-administration
Alias: $profMedicationRequest = http://canshare.co.nz/fhir/StructureDefinition/an-medication-request


Alias: $profCarePlan-patient = http://canshare.co.nz/fhir/StructureDefinition/an-careplan-patient
Alias: $profCarePlan-regimen = http://canshare.co.nz/fhir/StructureDefinition/an-careplan-regimen
Alias: $profCarePlan-cycle = http://canshare.co.nz/fhir/StructureDefinition/an-careplan-cycle

Alias: $histology = http://canshare.co.nz/fhir/StructureDefinition/an-histology
Alias: $ecog = http://canshare.co.nz/fhir/StructureDefinition/an-ecog
Alias: $bsa = http://canshare.co.nz/fhir/StructureDefinition/an-bsa

Alias: $er-status = http://canshare.co.nz/fhir/StructureDefinition/an-er-status
Alias: $pr-status = http://canshare.co.nz/fhir/StructureDefinition/an-pr-status
Alias: $her2-status = http://canshare.co.nz/fhir/StructureDefinition/an-her2-status


//Alias: $regimen-outcome = https://nzhts.digital.health.nz/fhir/ValueSet/canshare-sact-regimen-outcome

Alias: $creat-clear = http://canshare.co.nz/fhir/StructureDefinition/an-creat-clear
Alias: $height = http://canshare.co.nz/fhir/StructureDefinition/an-height
Alias: $weight = http://canshare.co.nz/fhir/StructureDefinition/an-weight


Alias: $extFacilityAdministered = http://canshare.co.nz/fhir/StructureDefinition/an-facility-administered


//Aliases for TNM
Alias: $cT = http://canshare.co.nz/fhir/StructureDefinition/an-cT
Alias: $cN = http://canshare.co.nz/fhir/StructureDefinition/an-cN
Alias: $cM = http://canshare.co.nz/fhir/StructureDefinition/an-cM
Alias: $cGroup = http://canshare.co.nz/fhir/StructureDefinition/an-cGroup

Alias: $pT = http://canshare.co.nz/fhir/StructureDefinition/an-pT
Alias: $pN = http://canshare.co.nz/fhir/StructureDefinition/an-pN
Alias: $pM = http://canshare.co.nz/fhir/StructureDefinition/an-pM
Alias: $pGroup = http://canshare.co.nz/fhir/StructureDefinition/an-pGroup


Alias: $gleason = http://canshare.co.nz/fhir/StructureDefinition/an-gleason

//Aliases for extensions
Alias: $iot = http://canshare.co.nz/fhir/StructureDefinition/an-iot
Alias: $clinicalTrial = http://canshare.co.nz/fhir/StructureDefinition/an-clinical-trial
Alias: $extCycleCount = http://canshare.co.nz/fhir/StructureDefinition/an-cycle-count

Alias: $extLastAdminDate = http://canshare.co.nz/fhir/StructureDefinition/an-last-admin-date

Alias: $extCourseNumber = http://canshare.co.nz/fhir/StructureDefinition/an-course-number


Alias: $extRegimenDiscontinued = http://canshare.co.nz/fhir/StructureDefinition/an-regimen-discontinued
Alias: $extRegimenOTU = http://canshare.co.nz/fhir/StructureDefinition/an-regimen-otu
Alias: $extCycleNumber = http://canshare.co.nz/fhir/StructureDefinition/an-cycle-number
Alias: $extBasedOn = http://canshare.co.nz/fhir/StructureDefinition/an-based-on
Alias: $extCycleDay = http://canshare.co.nz/fhir/StructureDefinition/an-cycle-day
Alias: $extCyclePlannedLength = http://canshare.co.nz/fhir/StructureDefinition/an-cycle-planned-length

Alias: $extPrescribedDose = http://canshare.co.nz/fhir/StructureDefinition/an-prescribed-dose
//Alias: $extPlannedDose = http://canshare.co.nz/fhir/StructureDefinition/an-planned-dose


Alias: $extDoseAdjustmentReason = http://canshare.co.nz/fhir/StructureDefinition/an-dose-adjustment-reason
Alias: $extRecurrenceType = http://canshare.co.nz/fhir/StructureDefinition/an-recurrence-type

//ValueSet & Codesystem urls
//note that all codesystems will become snomed eventually...
Alias: $regimen-discontinued-reason-vs = https://nzhts.digital.health.nz/fhir/ValueSet/canshare-sact-overall-discontinue-reason
//Alias: $regimen-discontinued-reason-cs = http://canshare.co.nz/fhir/CodeSystem/an-regimen-discontinued-reason-cs

Alias: $regimen-discontinued-patient-factors-vs = https://nzhts.digital.health.nz/fhir/ValueSet/canshare-sact-patient-factor-discontinue-reason
//Alias: $regimen-discontinued-patient-factors-cs = http://canshare.co.nz/fhir/CodeSystem/an-regimen-discontinued-patient-factors-cs

Alias: $regimen-discontinued-toxicity-vs = https://nzhts.digital.health.nz/fhir/ValueSet/canshare-sact-toxicity-discontinue-reason
//Alias: $regimen-discontinued-toxicity-cs = http://canshare.co.nz/fhir/CodeSystem/an-regimen-discontinued-toxicity-cs

Alias: $regimen-outcome-vs = https://nzhts.digital.health.nz/fhir/ValueSet/canshare-sact-regimen-outcome

Alias: $regimen-iot-vs = https://nzhts.digital.health.nz/fhir/ValueSet/canshare-treatment-intent
//Alias: $regimen-iot-cs = https://nzhts.digital.health.nz/fhir/ValueSet/canshare-treatment-intent

Alias: $dose-adjustment-reason-vs = https://nzhts.digital.health.nz/fhir/ValueSet/canshare-sact-dose-adjustment-reason
//Alias: $dose-adjustment-reason-cs = http://canshare.co.nz/fhir/CodeSystem/an-dose-adjustment-reason-cs

Alias: $ecog-status-vs = https://nzhts.digital.health.nz/fhir/ValueSet/canshare-sact-ecog-status
Alias: $dx-basis-vs = https://nzhts.digital.health.nz/fhir/ValueSet/canshare-sact-basis-of-cancer-diagnosis
Alias: $recurrence-type-vs = https://nzhts.digital.health.nz/fhir/ValueSet/canshare-recurrence-type
Alias: $er-status-vs = https://nzhts.digital.health.nz/fhir/ValueSet/canshare-sact-er-expression
Alias: $pr-status-vs = https://nzhts.digital.health.nz/fhir/ValueSet/canshare-sact-pr-expression
Alias: $her2-status-vs = https://nzhts.digital.health.nz/fhir/ValueSet/canshare-sact-her2-expression

//-------- new aliases


