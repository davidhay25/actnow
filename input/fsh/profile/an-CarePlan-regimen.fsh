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
    $iot  named iot 0..1 and                //intent of treatment
    $clinicalTrial named clinicalTrial 0..1  and //is part of a clinical trial
    $extRegimenDiscontinued named reasonDiscontinued 0..1 and //If the regimen was discontinued
    $extCycleCount named CycleCount 0..1 //The number of cycles administered under this regimen


//slicing on category
* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "category.code"
* category ^slicing.rules = #open
* category ^slicing.description = "Slice based on the category.code pattern"

* category contains 
    regimencode 1..1 MS 

* category[regimencode] ^short = "Regimen level carePlan"
* category[regimencode] ^definition = "Code identifiying this carePlan as being at the regimen level"
* category[regimencode].coding = http:example.org#regimenCP

