Profile:        AnCondition
Parent:         Condition
Id:             an-condition
Title:          "ACT-NOW diagnosis"
Description:    """
The primary diagnosis for this cancer. Can have an evidence.detail reference to an Observation
that has the histology and a stage.assessment reference to the TNM Observation staging (clinical and pathological)"""

* ^url = $profCondition
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* extension contains
    http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-laterality-qualifier named laterality 0..1 and
    http://hl7.org/fhir/StructureDefinition/condition-assertedDate named assertedDate 0..1 and
    $extRecurrenceType named recurrence-type 0..1

* identifier 1..*
* bodySite 1..1         //the body site is required...


//The assessment staging must be to the TNM group resources - clincian & pathological
* stage.assessment only Reference(ObservationPathTNMGroup or ObservationClinTNMGroup)

//the evidence is only to a histology Observation. We can always add others later if needed
* evidence.detail only Reference(ObservationHistology)

//there is also a need for 'basis of diagnosis'. This also seems like it belongs in evidence
* evidence.code from $dx-basis-vs

