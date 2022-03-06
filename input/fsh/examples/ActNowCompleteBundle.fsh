//General comments
//Use extension if the thing doesn't really stand alone - eg intent of treatment

//Todo
//add FSH to IG so easy to reference...

Alias: $clinfhircs = http://clinfhir.com/codesystem     //placeholder codesystem

//view in BV: http://localhost:8081/bundleVisualizer.html?http://build.fhir.org/ig/davidhay25/canshare/branches/main/Bundle-an-completeBundle.json

Instance: an-completeBundle
InstanceOf: Bundle
Description: "A Bundle containing all the resources for a single cycle of treatment for a regimen"
* type = #collection


* entry[+].resource = an-patient
* entry[+].resource = an-practitioner

//Diagnosis
* entry[+].resource = an-cancer

//Clincial TNM
* entry[+].resource = cTNM
* entry[+].resource = cT
* entry[+].resource = cN
* entry[+].resource = cM

* entry[+].resource = cycle1
* entry[+].resource = regimenPlan1
* entry[+].resource = medication1

* entry[+].resource = regimenOutcome

* entry[+].resource = ecog-regimen

* entry[+].resource = ecog-cycle1
* entry[+].resource = bsa-cycle1

* entry[+].resource = an-careteam



//---Clinical TNM
//aligned with mCode
//todo - what is group & edition

Instance: cT
InstanceOf: Observation
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>T3</div>"
* text.status = #generated
* subject = Reference(an-patient)
* effectiveDateTime = "2020-01-01"
* status = #final
* code = $loinc#21905-5 "Primary tumor.clinical [Class] Cancer"
* valueCodeableConcept = http://cancerstaging.org#cT3 "T3"

Instance: cN
InstanceOf: Observation
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>N3</div>"
* text.status = #generated
* subject = Reference(an-patient)
* effectiveDateTime = "2020-01-01"
* status = #final
* code = $loinc#21906-3 "Regional lymph nodes.clinical [Class] Cancer"
* valueCodeableConcept = http://cancerstaging.org#cN3 "N3"

Instance: cM
InstanceOf: Observation
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>M0</div>"
* text.status = #generated
* subject = Reference(an-patient)
* effectiveDateTime = "2020-01-01"
* status = #final
* code = $loinc#21907-3 "Distant metastases.clinical [Class] Cancer"
* valueCodeableConcept = http://cancerstaging.org#cM0 "M0"

Instance: cTNM
InstanceOf: Observation
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Clinical TNM</div>"
* text.status = #generated
* subject = Reference(an-patient)
* status = #final
* code = http://loinc.org#21908-9 "Stage group.clinical Cancer"
* effectiveDateTime = "2020-01-01"
* valueCodeableConcept = http://cancerstaging.org#3C "IIIC"
* method = http://snomed.info/sct#897275008 "American Joint Commission on Cancer, Cancer Staging Manual, 8th edition neoplasm staging system (tumor staging)"
* hasMember[0] = Reference(cT)
* hasMember[+] = Reference(cN)
* hasMember[+] = Reference(cM)


// todo ------- pathological TNM
//todo: how is it different from Clinical TNM (not defined in mcode)
//todo - what is group & edition
//https://hl7.org/fhir/us/mcode/Observation-tnm-pathologic-stage-group-jenny-m.html

//---- regimen ------
//modelled as a careplan with references to observations through a supportingInfo reference

Instance: regimenPlan1
InstanceOf: CarePlan
Title: "Regimen details"
Usage: #example
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Regimen</div>"
* text.status = #generated
* title = "Plan for regemen derived from: http://PlanDefinition/lungcancer1"
* subject = Reference(an-patient)
* author = Reference(an-practitioner)
* status = #active
* intent = #plan
* instantiatesCanonical = "http://PlanDefinition/lungcancer1"
* supportingInfo = Reference(ecog-regimen)
* addresses = Reference(an-cancer)
* category = http://canshare.com#regimenCP
* careTeam = Reference(an-careteam)

* supportingInfo[0] = Reference(cTNM)

//intent of treatment - not the same as the CaprePlan.intent
* extension[+].url = "http://actnow/intent-of-treatment"
* extension[=].valueCodeableConcept.text = "palliative"

//Is this regimen part of a clinical trial
* extension[+].url = "http://actnow/clinical-trial"
* extension[=].valueBoolean = false


//An ECOG score at the start of the regimen. mCode uses an observation.
//https://hl7.org/fhir/us/mcode/StructureDefinition-mcode-ecog-performance-status.html

Instance: ecog-regimen
InstanceOf: ObservationEcog
Title: "ECOG at start of regimen"
Usage: #example
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>ECOG observation</div>"
* text.status = #generated
* subject = Reference(an-patient)
* performer = Reference(an-practitioner)

* effectiveDateTime = "2020-01-01"
* status = #final
* code = $loinc#89247-1 "ECOG score"
* valueInteger = 3  

//The outcome of the regimen. Created when the regimen has been completed or cancelled
Instance: regimenOutcome
InstanceOf: ObservationRegimenOutcome
Title: "Outcome of regimen"
Usage: #example
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Regimen Outcome</div>"
* text.status = #generated
* subject = Reference(an-patient)
* performer = Reference(an-practitioner)
* effectiveDateTime = "2020-01-01"   //the date the observation was made...
* status = #final
* code = $actnow#regimenoutcome
* code.text = "Regimen outcome"
* basedOn = Reference(regimenPlan1)
// testing...* basedOn = Reference(ecog-regimen)
* valueInteger = 1      //the OTU - Overall treatment utility

//the regimen was discontinued
* extension[+].url = "http://actnow/regimen-discontinued"
* extension[=].extension[+].url = "date"
* extension[=].extension[=].valueDateTime = "2020-02-02T12:00:00Z"
* extension[=].extension[+].url = "reason"
* extension[=].extension[=].valueCodeableConcept.text = "Not tolerated by patient"
* extension[=].extension[+].url = "patientfactors"
* extension[=].extension[=].valueCodeableConcept.text = "Nausea"
* extension[=].extension[+].url = "toxicity"
* extension[=].extension[=].valueCodeableConcept.text = "low WCC"

//number of cycles administered of this regimen
* extension[+].url = "http://actnow/cycle-count"
* extension[=].valueInteger = 5

//OTU measures
* extension[+].url = "http://actnow/otu"
//* extension[=].extension[+].url = "value"
//* extension[=].extension[=].valueInteger = 1
* extension[=].extension[+].url = "benefit"
* extension[=].extension[=].valueInteger = 1
* extension[=].extension[+].url = "acceptable"
* extension[=].extension[=].valueInteger = 1


//-------------------- end of regimen resources

//---- First cycle --------
//The first cycle of treatment - ie multiple medication administrations and potentially observatopns
//Modelled as a CarePlan with a 'partOf' reference to the regimen careplan
//Created before the first cycle commences - must be after the regiman cp has been created
Instance: cycle1
InstanceOf: CarePlan
Title: "First cycle of treatment"
Usage: #example
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Cycle1</div>"
* text.status = #generated

* title = "Cycle1 Plan for regimen derived from: http://PlanDefinition/lungcancer1"

* subject = Reference(an-patient)
* author = Reference(an-practitioner)
* category = http://canshare.com#cycleCP

//* effectiveDateTime = "2020-01-01"
* status = #active
* intent = #plan
// cycle length - period end-start
* period.start = "2020-01-01"
* period.end = "2020-02-01"
* partOf = Reference(regimenPlan1)
* addresses = Reference(an-cancer)
* careTeam = Reference(an-careteam)

//the cycle number
//todo - what is the last admin date? could be derived from the MedicationAdmin resources that have a 'basedOn' reference to this plan
* extension[+].url = "http://actnow/cycle-number"
* extension[=].valueInteger = 1

* supportingInfo = Reference(ecog-cycle1)
* supportingInfo = Reference(bsa-cycle1)




Instance: ecog-cycle1
InstanceOf: Observation
Title: "ECOG at start of cycle 1"
Usage: #example
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>ECOG cycle 1</div>"
* text.status = #generated
* subject = Reference(an-patient)
* performer = Reference(an-practitioner)
* effectiveDateTime = "2020-01-01"
* status = #final
* code = $loinc#89247-1 "ECOG score"
* valueInteger = 3  

Instance: bsa-cycle1
InstanceOf: Observation
Title: "BSA at start of cycle 1"
Usage: #example
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>BSA cycle 1</div>"
* text.status = #generated
* subject = Reference(an-patient)
* performer = Reference(an-practitioner)
* effectiveDateTime = "2020-01-01"
* status = #final
* code = $loinc#8277-6 "BSA"
* valueQuantity.value = 1.8  
* valueQuantity.unit = "m2"


//The outcome of the cycle. Created when the regimen has been completed or cancelled
Instance: cycle1Outcome
InstanceOf: Observation
Title: "Outcome of regimen"
Usage: #example
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Regimen Outcome</div>"
* text.status = #generated
* subject = Reference(an-patient)
* performer = Reference(an-practitioner)
* effectiveDateTime = "2020-01-01"
* status = #final
* code.text = "Regimen outcome"
* basedOn = Reference(regimenPlan1)


//------- medication administration
Instance: medication1
InstanceOf: MedicationAdministration
Title: "A single medication administration"
Usage: #example
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Methotrexate</div>"
* text.status = #generated
* subject = Reference(an-patient)
* performer.actor = Reference(an-practitioner)
* status = #completed
* effectivePeriod.start = "2020-01-10T10:00:00Z"
* effectivePeriod.end = "2020-01-10T11:00:00Z"
* medicationCodeableConcept = http://nzulm.co.nz#1234
* dosage.text = "10 ml over 1 hour"

* extension[0].url = "http://clinfhir.com/StructureDefinition/based-on"
* extension[=].valueReference = Reference(cycle1)

* extension[0].url = "http://clinfhir.com/StructureDefinition/cycleday"
* extension[=].valueInteger = 1

* extension[+].url = "http://clinfhir.com/StructureDefinition/creatinineclearance"
* extension[=].valueReference = Reference(cc1)

* extension[+].url = "http://clinfhir.com/StructureDefinition/prescribeddose"
* extension[=].valueDosage.text = "10 ml over 1 hour"

* extension[+].url = "http://clinfhir.com/StructureDefinition/adjustmentreason"
* extension[=].valueCodeableConcept.text = "Nausea on previous administrations"

//creatanine clearance
Instance: cc1
InstanceOf: Observation
Title: "Creatinine clearance"
Usage: #example
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Cycle summary</div>"
* text.status = #generated
* subject = Reference(an-patient)
* effectiveDateTime = "2020-01-01"
* status = #final
* code = $loinc#2164-2 "creatinine clearance"
* valueQuantity.value = 70
* valueQuantity.unit = "uMol/L"

//------------------------  Cancer diagnosis
Instance: an-cancer
InstanceOf: Condition
Title: "The cancer being treated"
Usage: #example



//todo recurrance
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Small cell carcinoma</div>"
* text.status = #generated

* extension[+].url = "http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-laterality-qualifier"
* extension[=].valueCodeableConcept = $snomed#7771000 "Left (qualifier value)"

* extension[+].url = "http://hl7.org/fhir/StructureDefinition/condition-assertedDate"
* extension[=].valueDate = "2020-01-01"

* clinicalStatus = #active
* verificationStatus = #confirmed
* subject = Reference(an-patient)

* code = $snomed#254632001 "Small cell carcinoma of lung"
* bodySite = $snomed#3341006
* stage.summary = $snomed#786005 "Clinical stage I B"        //?equivalent to grade

Instance: an-patient
InstanceOf: Patient
Title: "Lorrie Lung"
Usage: #example
* text.status = #generated
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Lorrie Lung</div>"
* birthDate = "1989-02-02"
* name.given = "Lorrie"
* name.family = "Lung"
* name.text = "Lorrie Lung"
* identifier.system = "https://standards.digital.health.nz/ns/nhi-id"
* identifier.value = "WER4568"

Instance: an-practitioner
InstanceOf: Practitioner
Title: "Marcus Welby"
Usage: #example
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Marcus Welby</div>"
* text.status = #generated
* name.given = "Marcus"
* name.family = "Welby"
* name.text = "Marcus Welby"
* identifier.system = "https://standards.digital.health.nz/ns/hpi-person-id"
* identifier.value = "hpi1"

Instance: an-careteam
InstanceOf: CareTeam
Title: "Auckland Oncology"
Usage: #example
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Auckland Oncology</div>"
* text.status = #generated

* name = "Auckland Oncology"