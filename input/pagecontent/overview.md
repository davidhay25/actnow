The following diagram shows the key resources supporting act-now data structures

<img style="width:800px; float:none" src="graphOverview.png"/>


Note that this image shows only the key resources - most will have a reference to Patient and Practitioner, at least.



Notes

* Both regime and cycle are represented by CarePlan resources, with the cycle CPs being linked to the regimen CP using the ‘partOf’ references. The CP’s are created prior to treatment commencing. Information that is collected at the time the CP is created (such as TNM or ECOG score are represented as Observations with a ‘supportingInfo’ reference from the CP to the resource
* Each CP has an ‘outcome’ Observation that references the CP via a ‘basedOn’ reference. These are created after a regimen/cycle has been completed - hence the direction of the link
* Could also have an ‘outcome’ extension on the CP as we have to update the CP.status anyway. Extension could be to Observation or directly on CP - but the outcome migh not be done by the same author as the CP - separate resource feels better
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
