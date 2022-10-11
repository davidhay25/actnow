Profile:        CareplanRegimen
Parent:         CarePlan
Id:             an-careplan-regimen
Title:          "Regimen Careplan"
Description:    """
A CarePlan that represents a PlanDefinition being applied to a Patient. Referred to as a regimen. The regimen
has multiple cycles also represented as CarePlans which have a 'partOf' reference back to the regimen plan."""

* ^url = $profCarePlan-regimen
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^text.status = #additional
* ^text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>A CarePlan that represents a PlanDefinition being applied to a Patient.</div>"

//* title 1..1
* identifier 1..*

* extension contains
    $iot  named iot 1..1 and                //intent of treatment
    $clinicalTrial named clinicalTrial 0..1  and //is part of a clinical trial
    $extCycleCount named cycle-count 1..1 MS and  //the number of cycles administered thus far
    $extRegimenDiscontinued named regimen-discontinued 0..1 MS and
    $extRegimenOTU named otu 0..1 MS and
    $regimen-type named regimen-type 1..1  //type of regimen - eg folfox


* period obeys an-period-1      //end >= start

//slicing on category
* category.coding ^slicing.discriminator.type = #pattern
* category.coding ^slicing.discriminator.path = "code"
* category.coding ^slicing.rules = #open


* category.coding contains 
    regimencode 1..1 MS 

* category.coding[regimencode] ^short = "Regimen level carePlan"
* category.coding[regimencode] ^definition = "Code identifying this carePlan as being at the regimen level"
* category.coding[regimencode].code = #regimenCP
* category.coding[regimencode].system = $unknownSystem


* obeys an-regimenCP-1

//Invariants

Invariant: an-regimenCP-1
Expression: "CarePlan.status = 'revoked' implies extension('http://canshare.co.nz/fhir/StructureDefinition/an-regimen-discontinued').exists()"
Severity: #error
Description: "If the CarePlan was cancelled, then the cancellation reason extension must be present"
