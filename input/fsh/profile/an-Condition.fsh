Profile:        AnCondition
Parent:         Condition
Id:             an-condition
Title:          "ACT-NOW diagnosis"
Description:    "A diagnosis"

* ^url = $profCondition
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* extension contains
   // http://hl7.org/fhir/us/mcode/StructureDefinition/mcode-laterality-qualifier named laterality 0..1 and
    http://hl7.org/fhir/StructureDefinition/condition-assertedDate named assertedDate 0..1

* identifier 1..*