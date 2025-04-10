
### Overview
This page describes the resource graph developed to represent the ACT-NOW data standard as FHIR resources. 

The general flow by which a patient receives cancer treatment, and the corresponding FHIR representation, is as follows.

* A patient has a diagnosis of cancer, as determined on histological and clinical grounds. This diagnosis is represented as a Condition resource, with Observation resources representing the histological and other findings that led to that diagnosis. In particular there are a number of 'ancillary' tests that are performed for particular diagnoses - such as Estrogen receptor status of Breast cancer. These tests are represented as Observations, and are important in determining the treatment protocol.

* Once diagnosed, a treatment plan is determined. Each cancer type has a number of possible treatment regimens that can be applied, each of which consists of a number of cycles of treatment - specifically administration of medications. The treatment regimens are represented as PlanDefinition and ActivityDefinitions, and there is a [separate IG](http://build.fhir.org/ig/HL7NZ/cca/branches/master/index.html) that defines how this is done.

* The Clinician/s planning the treatment will select the regimen to apply, and this is represented for the individual patient in a CarePlan resource. Currently, the mechanics of this is outside of the scope of this guide, but the CarePlan resource is used to support any future expansion of the scope.

* A regimen of treatment consists of a number of separate cycles of medication administration which may be repeated a number of times. Both regimen and cycle are represented as CarePlan resources, with the Cycle plan being related to the Regimen plan using the 'partOf' reference. The CarePlan.category value indicates whether the plan is a regimen or a cycle (or, indeed, something else).

* When a regimen is started, there are a number of initial measurements taken (such as Body Surface are). These are represented as Observation resources referenced from the plan using 'supportingInfo' references. When the regimen completes (or is cancelled) there are other Observations made that record the outcome of treatment, and possible the reason for cancellation. These Observations have a reference back to the plan using the Observation.basedOn reference.

* Similarly, when a cycle starts and ends there are Observations which may be recorded.

* An individual medication administration is related to the Cycle plan under which it was given. If the medication was actually given to the patient it is represented as a MedicationAdministration resource. If it is a prescription given to a patient it will be represented as a MedicationRequest resource.


The following diagram shows an example of a small set of data for a patient, with only a single cycle. Note that all the resources will have a reference to the Patient, and some to a Practitioner - these are not shown for clarity.

<img style="width:800px; float:none" src="graph-10.png"/>

The image is shown with a central column of the [Diagnosis](StructureDefinition-an-condition.html) (with supporting [histology](StructureDefinition-an-histology.html) and assessment), then the [regimen](StructureDefinition-an-careplan-regimen.html) and [cycle](StructureDefinition-an-careplan-cycle.html) care plans. Usually there will be multiple cycle plans for any given regimen.


To the left are Observations made before the start of a regimen / cycle - blood tests and other ancillary studies. These have a reference from the CarePlan to the resource using a 'supportingInfo' reference as (in theory) the observations would exist prior to the CarePlan being created.

To the right are Observations made when the regimen / cycle ends, mostly blood tests. The reference is from the Observation to the CarePlan (using a 'basedOn' reference) as they are created after the CarePlan. The profiles that define these measurements include:
* [Creatinine Clearance](StructureDefinition-an-creat-clear.html)
* [ECOG score](StructureDefinition-an-ecog.html)

(These might also be taken prior to the regimen starting, in which case the reference is 'addintionalInfo' from CarePlan to Observation)

Outcome measures are recorded as extensions on the CarePlan itself, as the CarePlan has to be updated anyway to update the status, and it makes it easier to read that information. These can be seen on the [Regimen CarePlan profile](StructureDefinition-an-careplan-regimen.html) and the [Cycle CarePlan profile](StructureDefinition-an-careplan-cycle.html) 

At the bottom are the medication administrations (ie medications actually given to the patient like an IV infusion) and prescriptions (represented as a MedicationRequest).

Note that other resources and references between resources are certainly possible if appropriate, but the ones defined in this page are the base ones defined. 

Most of the resources are created and not subsequently updated (other than any error correction). However, the CarePlans (regimen and Cycle) may be updated over time as their status. If the information were being submitted in real-time:

* The regimen plan is created with the status of 'active'
* A Cycle plan is added with an active status (it may have references to other resources)
* Medications are recorded with a reference to the cycle plan (which itself is not updated)
* When the last medication is given, the cycle plan is updated setting the status to 'completed'. 'Outcome' resources (Observations) are created which have a reference back to the cycle plan.
* When the last cycle has completed, the regimen plan is updated and closed. This might include adding extensions like [reason cancelled](StructureDefinition-an-regimen-discontinued.html)



This all means that the CarePlans may have multiple versions, though only the most recent one is generally retrieved when querying the server (The [history](http://hl7.org/fhir/http.html#history) operations can be used to retrieve previous versions, though these are not considered in this guide).


### Specific data requirements

#### Regimen used
All treatment follows a pre-determined regimen (pattern) of treatment (though can be adapted to the patient depending on their response to treatment). The regimens are defined in a separate IG (using a combination of PlanDefinition & ActivityDefinition resources ).

When a regimen is applied to a patient, it is represented as an instance of a [CarePlan](StructureDefinition-an-careplan-regimen.html). It is possible for there to be a reference to the PlanDefinition using the [*instantiatesCanonical*](http://hl7.org/fhir/careplan-definitions.html#CarePlan.instantiatesCanonical) element, but this is not currently defined in this guide, as the instrastructure is not yet generally available.

There are a number of extensions defined which can be applied to the CarePlan - such as the [intent of treatment](StructureDefinition-an-iot.html) or whether this treatment is part of a [clinical trial](StructureDefinition-an-clinical-trial.html).

#### Diagnosis
The diagnosis is recorded as a Condition resource. If there is histology supporting the diagnosis, then that is represented as an Observation, and the Condition has an *evidence* reference to the Observation.

The CarePlan that represents the regimen being followed should have an *addressses* reference to the Condition

### Staging information
This records how advanced a tumour is, and is generally recorded using the 'TNM' mechanism which measures the Tumour size, Involvement of Local nodes and metastases.

Following the pattern of [mcode](https://hl7.org/fhir/us/mcode/index.html) these are recorded as 4 distinct Observations - One for each of the TNM measures, and a single 'summary' observation. The summary Observation has *hasMember* references to the individual Observations, and the regimen CarePlan has a *supportingInfo* reference to the summary Observation.

It is also possible for there to be a reference from the Condition to the summary Observation using the *stage.assessment* reference.

<!--
Here's a diagram of the resources involved in Diagnosis and Staging (from the Reference Implementation)

<img style="width:800px; float:none" src="tnm.png"/>

-->

#### Measures made before treatment starts
Commonly there are measurements made before treatment commences - for example Creatinine Clearance test to determine drug dosages or the [ECOG score](StructureDefinition-an-ecog.html) so that the effectiveness of treatment can be determined.

Generally these are recorded as Observations, and the regimen CarePlan will have a *supportingInfo* reference to them.

#### Measures made after treatment ends
There are also measures that are made after the treatment ends - perhaps to record the effectiveness of treatment, or any damage caused by the medications. These are recorded as Observations, with a *basedOn* reference back to the regimen CarePlan


#### Representing a cycle of treatment
Each cycle of treatment is represented by a separate [CarePlan](StructureDefinition-an-careplan-cycle.html) resource - ie each cycle has its own CarePlan. The status of the CarePlan will be *active* when treatment defined by the cycle is being given and *completed* once the cycle has been completed. 

If the cycle needs to be stopped early for any reason - such as patient intolerance - then the status will be *revoked* and there will often be an [Observation]() that records the reason why. The Observation will have a *basedOn* reference back to the cycle carePlan. 

Like the regimen CarePlan it is also possible to have measures made before and after the cycle commences and starts. These are recorded using Observations in the same way as for the regimen.

#### Recording cancellation of treatment
Sometimes a regimen needs to be cancelled before it is completed. For example the side effects of treatment are so severe as to warrant a new regimen being considered. 

The regimen CarePlan status will be *revoked* and there will often be an [Observation]() that records the reason why. The Observation will have a *basedOn* reference back to the regimen carePlan. 

If this happens during a cycle of treatment, then the cycle CarePlan will also be updated as described above.

#### Recording medication administrations
All medication administrations (actual delivery of the medication orally or parenterally) are recorded as MedicationAdministration resources.

The MedicationAdministration needs a reference back to the cycle CarePlan. This is done using a *supportingInformation* reference.

(As an aside, in FHIR release 5 there is a specific *basedOn* reference that might be used). 

#### Measures taken during medication administration
Sometimes measures are taken before or after medication administration. These are represented as Observations, and should have a reference to the cycle CarePlan via the *basedOn* reference.

The MedicationAdministration resource might also reference them using the *spportingInformation* reference.

### Recording prescriptions given
If the patient was given a prescription for a medication - rather than having it administered by someone, then the apprppriate resource type is MedicationRequest. It also references the cycle CarePlan by a *supportingInformation* reference.



<!--
----

Note that this image shows only the key resources - most will have a reference to Patient and Practitioner, at least.


>>> describe each resource type, key usages, link to spec, link to profiles
    key elements - ie cp.category
>>> beef up profiles description - 

specific 'areas' in graph
    TNM stuff
    Histology & condition


Notes

* Both regime and cycle are represented by CarePlan resources, with the cycle CPs being linked to the regimen CP using the ‘partOf’ references. The CP’s are created prior to treatment commencing. Information that is collected at the time the CP is created (such as TNM or ECOG score are represented as Observations with a ‘supportingInfo’ reference from the CP to the resource
* Each CP has an ‘outcome’ Observation that references the CP via a ‘basedOn’ reference. These are created after a regimen/cycle has been completed - hence the direction of the link
* Could also have an ‘outcome’ extension on the CP as we have to update the CP.status anyway. Extension could be to Observation or directly on CP - but the outcome might not be done by the same author as the CP - separate resource feels better
* The actual administration of a medication is represented by a MedicationAdministration resource, with a basedOn reference to the cycle CP. There are other resources referenced from the MedicationAdministration (such as the creatinine clearance) using the ‘supportingInformation’ reference
* Most resources also have extensions (not showing in the diagram above)
* The CareTeam resource is useful to provide a link to the - well - care team. Not directly part of act-now, but useful in an on-line repository


There’s a [full example](Bundle-an-completeBundle.html) in the IG - [This link](http://clinfhir.com/bundleVisualizer.html?http://build.fhir.org/ig/davidhay25/canshare/branches/main/Bundle-an-completeBundle.json) will show it in the bundle visualizer.

Overall pattern if being used in real time.

* The regimen to use is chosen. The Regimen CarePlan and associated ‘supportinginfo’ resources (eg TNM) are created.
* The first cycle starts. The cycle CarePlan is created (referenced back to the regimen CP) along with any ‘supportingInfo’ resources - such as the ECOG and BSA Observations. Note that supporting resources can be added later, and all planned cycles could be created initially, using the status to control - draft, active completed
* Treatment is administered. Each administration is represented as a MedicationAdministration resource, with a ‘basedOn’ reference to the cycle CarePlan. An administration might also have a ‘supportingInfo’ reference as well - eg to a creatinine clearance observation.
* When the cycle is complete (whether it completes or is cancelled partway through), the Cycle CarePlan status is updated to indicate it is no longer active, and an ‘outcome; Observation is created and referenced back to the Cycle CP. At this point a new cycle might start with resources created as in step 2
* When the regimen is complete (or cancelled), the regimen CP status is updated and an ‘outcome’ observation is created as was done for cycle completion. Potentially, a new regimen starts as from step 1 above.

If the data is not being entered in real time - ie a summary after the event -, then the submitting system creates a bundle of resources following this pattern and saves them on the canshare server.

Could get more complex if there are regular updates over a period of time for long running treatment. Each new ‘batch’ would need to refer to existing resources. Might need to define when a new batch is sent - perhaps when a cycle or regimen is completed. 

-->