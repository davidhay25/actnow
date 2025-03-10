### ValueSets

These are ValueSets that have been defined in this guide for coded elements. 

Each ValueSet resource has a globally unique url (the [Canonical](http://hl7.org/fhir/references.html#canonical) url) that is used to unambiguously identify it. 
This url generally should resolve to the to the FHIR ValueSet resource, though the infrastructure 
to support this is not yet in place. There's a [specific note](http://hl7.org/fhir/valueset.html#ident) in the spec on ValueSet identification.

The [FHIR spec](http://hl7.org/fhir/terminology-module.html) has much more detail on the use of Terminology in FHIR.


<table class='table table-bordered table-condensed'>
<tr><th>ValueSet</th><th>Purpose</th><th>Canonical url</th></tr>
<tr><td width='20%'><a href='ValueSet-an-dx-basis-vs.html'>Basis of diagnosis</a></td><td><p>Types of evidence that may be used to reach a cancer diagnosis, which is treated with systemic anti cancer therapy (SACT).</p></td><td>https://nzhts.digital.health.nz/fhir/ValueSet/canshare-sact-basis-of-cancer-diagnosis</td></tr>
<tr><td width='20%'><a href='ValueSet-an-tnm-cm.html'>Clinical M score</a></td><td><p>The TNM group score</p></td><td>https://nzhts.digital.health.nz/fhir/ValueSet/canshare-tnm-cm</td></tr>
<tr><td width='20%'><a href='ValueSet-an-tnm-cn.html'>Clinical N score</a></td><td><p>The clincial N score</p></td><td>https://nzhts.digital.health.nz/fhir/ValueSet/canshare-tnm-cn</td></tr>
<tr><td width='20%'><a href='ValueSet-an-tnm-ct.html'>Clinical T score</a></td><td><p>The clinical T score</p></td><td>https://nzhts.digital.health.nz/fhir/ValueSet/canshare-tnm-ct</td></tr>
<tr><td width='20%'><a href='ValueSet-an-clin-tnmgroup.html'>Clinical TNM group</a></td><td><p>The TNM group score</p></td><td>https://nzhts.digital.health.nz/fhir/ValueSet/canshare-tnm-clinical-stage-group</td></tr>
<tr><td width='20%'><a href='ValueSet-an-dose-adjustment-reason.html'>Dose adjustment reason</a></td><td><p>Reasons for adjusting the dose of a systemic anti-cancer therapy (SACT) treatment cycle plus other value.</p></td><td>https://nzhts.digital.health.nz/fhir/ValueSet/canshare-sact-dose-adjustment-reason</td></tr>
<tr><td width='20%'><a href='ValueSet-an-ecog-status-vs.html'>ECOG status</a></td><td><p>The performance status of a patient as defined by the Eastern Cooperative Oncology Group (ECOG) minus ECOG 5 (A performance status used when a patient is &#39;Dead&#39;).</p></td><td>https://nzhts.digital.health.nz/fhir/ValueSet/canshare-sact-ecog-status</td></tr>
<tr><td width='20%'><a href='ValueSet-an-er-status-vs.html'>ER status</a></td><td><p>A diagnosis of whether or not a tumour is estrogen receptive (ER) minus inconclusive value.</p></td><td>https://nzhts.digital.health.nz/fhir/ValueSet/canshare-sact-er-expression</td></tr>
<tr><td width='20%'><a href='ValueSet-her2-status-vs.html'>HER2 status</a></td><td><p>A diagnosis of the human epidermal growth factor receptor 2 (HER2) status of a tumour minus inconculsive value .</p></td><td>https://nzhts.digital.health.nz/fhir/ValueSet/canshare-sact-her2-expression</td></tr>
<tr><td width='20%'><a href='ValueSet-an-histology.html'>Histology</a></td><td><p>Histology</p></td><td>https://nzhts.digital.health.nz/fhir/ValueSet/canshare-who-sact-primary-histology</td></tr>
<tr><td width='20%'><a href='ValueSet-an-regimen-iot-vs.html'>Intent of treatment</a></td><td><p>Treatment intents or reasons for using a therapeutic procedure to treat cancer.</p></td><td>http://canshare.co.nz/fhir/ValueSet/an-regimen-iot-vs</td></tr>
<tr><td width='20%'><a href='ValueSet-an-clininal-trial.html'>Is on a clinical trial</a></td><td><p>Is on a clinical triale</p></td><td>https://nzhts.digital.health.nz/fhir/ValueSet/canshare-sact-drug-trial</td></tr>
<tr><td width='20%'><a href='ValueSet-an-regimen-outcome-vs.html'>Outcome of a regimen</a></td><td><p>The outcome of the prescribed regimen for the patient</p></td><td>http://canshare.co.nz/fhir/ValueSet/an-regimen-outcome-vs</td></tr>
<tr><td width='20%'><a href='ValueSet-pr-status-vs.html'>PR status</a></td><td><p>A diagnosis of whether or not a tumour is progesterone receptive (PR) minus inconculsive value.</p></td><td>https://nzhts.digital.health.nz/fhir/ValueSet/canshare-sact-pr-expression</td></tr>
<tr><td width='20%'><a href='ValueSet-an-path-m.html'>Pathological M score</a></td><td><p>Pathological M score</p></td><td>https://nzhts.digital.health.nz/fhir/ValueSet/canshare-tnm-pm</td></tr>
<tr><td width='20%'><a href='ValueSet-an-path-n.html'>Pathological N score</a></td><td><p>Pathological N score</p></td><td>https://nzhts.digital.health.nz/fhir/ValueSet/canshare-tnm-pn</td></tr>
<tr><td width='20%'><a href='ValueSet-an-path-t.html'>Pathological T score</a></td><td><p>Pathological T score</p></td><td>https://nzhts.digital.health.nz/fhir/ValueSet/canshare-tnm-pt</td></tr>
<tr><td width='20%'><a href='ValueSet-an-path-tnmgroup.html'>Pathological TNM group</a></td><td><p>The TNM group score</p></td><td>https://nzhts.digital.health.nz/fhir/ValueSet/canshare-tnm-pathological-stage-group</td></tr>
<tr><td width='20%'><a href='ValueSet-an-regimen-discontinued-patient-factors-vs.html'>Patient factors when discontinuing a regimen</a></td><td><p>Patient factors that may result in the discontinuation of a systemic anti-cancer therapy (SACT) treatment plus not asked value.</p></td><td>https://nzhts.digital.health.nz/fhir/ValueSet/canshare-sact-patient-factor-discontinue-reason</td></tr>
<tr><td width='20%'><a href='ValueSet-an-regimen-discontinued-reason-vs.html'>The reason why a regimen was discontinued</a></td><td><p>The reason why a regimen was discontinued</p></td><td>https://nzhts.digital.health.nz/fhir/ValueSet/canshare-sact-overall-discontinue-reason</td></tr>
<tr><td width='20%'><a href='ValueSet-an-regimen-discontinued-toxicity-vs.html'>Toxicity reasons why a regimen was discontinued</a></td><td><p>Toxicity factors that may result in the discontinuation of a systemic anti-cancer therapy (SACT) treatment.</p></td><td>https://nzhts.digital.health.nz/fhir/ValueSet/canshare-sact-toxicity-discontinue-reason</td></tr>
<tr><td width='20%'><a href='ValueSet-recurrence-type.html'>Type of recurrence</a></td><td><p>The type of cancer recurrence, e.g. local, regional plus unknown and not applicable values.</p></td><td>https://nzhts.digital.health.nz/fhir/ValueSet/canshare-recurrence-type</td></tr>
</table>
<br/><br/>
### CodeSystems

These are code systems that have been defined in this guide. They define specific concepts that are included in ValueSets. It is preferable to use an international code system such as SNOMED, ICD or LOINC - but this is not always possible.

Each CodeSystem resource has a globally unique url (the canonical url) that is used to unambiguously identify it. The url generally refers to a description of the codesystem, rather than to the FHIR CodeSystem resource.

The [FHIR spec](http://hl7.org/fhir/terminology-module.html) has much more detail on the use of Terminology in FHIR

<table class='table table-bordered table-condensed'>
<tr><th>CodeSystem</th><th>Purpose</th><th>Canonical Url</th></tr>
</table>