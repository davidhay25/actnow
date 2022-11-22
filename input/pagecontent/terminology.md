### ValueSets

These are ValueSets that have been defined in this guide for coded elements. 

Each ValueSet resource has a globally unique url (the [Canonical](http://hl7.org/fhir/references.html#canonical) url) that is used to unambiguously identify it. 
This url generally should resolve to the to the FHIR ValueSet resource, though the infrastructure 
to support this is not yet in place. There's a [specific note](http://hl7.org/fhir/valueset.html#ident) in the spec on ValueSet identification.

The [FHIR spec](http://hl7.org/fhir/terminology-module.html) has much more detail on the use of Terminology in FHIR.


<table class='table table-bordered table-condensed'>
<tr><th>ValueSet</th><th>Purpose</th><th>Canonical url</th></tr>
<tr><td width='20%'><a href='ValueSet-an-ecog-status-vs.html'>ECOG status</a></td><td><p>ECOG status</p></td><td>http://canshare.co.nz/fhir/ValueSet/an-ecog-status-vs</td></tr>
<tr><td width='20%'><a href='ValueSet-an-regimen-discontinued-patient-factors-vs.html'>Patient factors when discontinuing a regimen</a></td><td><p>Patient factors when discontinuing a regimen</p></td><td>http://canshare.co.nz/fhir/ValueSet/an-regimen-discontinued-patient-factors-vs</td></tr>
<tr><td width='20%'><a href='ValueSet-an-regimen-discontinued-reason-vs.html'>The reason why a regimen was discontinued</a></td><td><p>The reason why a regimen was discontinued</p></td><td>http://canshare.co.nz/fhir/ValueSet/an-regimen-discontinued-reason-vs</td></tr>
<tr><td width='20%'><a href='ValueSet-an-regimen-discontinued-toxicity-vs.html'>Toxicity reasons why a regimen was discontinued</a></td><td><p>Toxicity reasons why a regimen was discontinued</p></td><td>http://canshare.co.nz/fhir/ValueSet/an-regimen-discontinued-toxicity-vs</td></tr>
<tr><td width='20%'><a href='ValueSet-an-regimen-iot-vs.html'>Intent of treatment</a></td><td><p>What was the purpose of this treatment</p></td><td>http://canshare.co.nz/fhir/ValueSet/an-regimen-iot-vs</td></tr>
<tr><td width='20%'><a href='ValueSet-an-regimen-outcome-vs.html'>Outcome of a regimen</a></td><td><p>How did applying the regimen affect the patient</p></td><td>http://canshare.co.nz/fhir/ValueSet/an-regimen-outcome-vs</td></tr>
<tr><td width='20%'><a href='ValueSet-dose-adjustment-reason.html'>Dose adjustment reason</a></td><td><p>What was reason the dose was adjusted</p></td><td>http://canshare.co.nz/fhir/ValueSet/an-dose-adjustment-reason-vs</td></tr>
</table>
<br/><br/>
### CodeSystems

These are code systems that have been defined in this guide. They define specific concepts that are included in ValueSets. It is preferable to use an international code system such as SNOMED, ICD or LOINC - but this is not always possible.

Each CodeSystem resource has a globally unique url (the canonical url) that is used to unambiguously identify it. The url generally refers to a description of the codesystem, rather than to the FHIR CodeSystem resource.

The [FHIR spec](http://hl7.org/fhir/terminology-module.html) has much more detail on the use of Terminology in FHIR

<table class='table table-bordered table-condensed'>
<tr><th>CodeSystem</th><th>Purpose</th><th>Canonical Url</th></tr>
<tr><td width='20%'><a href='CodeSystem-an-regimen-discontinued-patient-factors-cs.html'>Patient factors when discontinuing a regimen</a></td><td><p>Patient factors when discontinuing a regimen</p></td><td>http://canshare.co.nz/fhir/CodeSystem/an-regimen-discontinued-patient-factors-cs</td></tr>
<tr><td width='20%'><a href='CodeSystem-an-regimen-discontinued-reason-cs.html'>The reason why a regimen was discontinued</a></td><td><p>The reason why a regimen was discontinued</p></td><td>http://canshare.co.nz/fhir/CodeSystem/an-regimen-discontinued-reason-cs</td></tr>
<tr><td width='20%'><a href='CodeSystem-an-regimen-iot-cs.html'>Intent of treatment</a></td><td><p>What was the purpose of this treatment</p></td><td>http://canshare.co.nz/fhir/CodeSystem/an-regimen-iot-cs</td></tr>
<tr><td width='20%'><a href='CodeSystem-an-regimen-outcome-cs.html'>Outcome of a regimen</a></td><td><p>How did applying the regimen affect the patient</p></td><td>http://canshare.co.nz/fhir/CodeSystem/an-regimen-outcome-cs</td></tr>
</table>