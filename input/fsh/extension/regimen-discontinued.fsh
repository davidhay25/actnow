Extension: RegimenDiscontinued
Id: regimen-discontinued
Description: "Reasons why a regimen may have been discontinued"

* ^url = $extRegimenDiscontinued // "http://hl7.org.nz/fhir/StructureDefinition/additional-authorisation"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^status = #draft

* ^context.type = #element
* ^context.expression = "Observation"

* extension contains
   // date 0..1 and
    reason 0..1 and
    patientfactors 0..* and
    toxicity 0..* 

// definitions of sub-extensions
/*
* extension[date].url = "date" (exactly)
* extension[date] ^definition = "The date that the regimen was discontinued. It will also be the in "
* extension[date] ^short = "The date that the regimen was discontinued"
* extension[date].value[x] only dateTime
*/
* extension[reason].url = "reason" (exactly)
* extension[reason] ^definition = "The overall reason why the regimen was discontinued"
* extension[reason] ^short = "The overall reason why the regimen was discontinued"
* extension[reason].value[x] only CodeableConcept
* extension[reason].valueCodeableConcept from $regimen-discontinued-reason-vs (preferred)

* extension[patientfactors].url = "patientfactors" (exactly)
* extension[patientfactors] ^definition = "Patient factors that contributed to the discontinuation"
* extension[patientfactors] ^short = "Patient factors that contributed to the discontinuation"
* extension[patientfactors].value[x] only CodeableConcept
* extension[patientfactors].valueCodeableConcept from $regimen-discontinued-patient-factors-vs (preferred)

* extension[toxicity].url = "toxicity" (exactly)
* extension[toxicity] ^definition = "Toxicity factors that contributed to the discontinuation"
* extension[toxicity] ^short = "Toxicity factors that contributed to the discontinuation"
* extension[toxicity].value[x] only CodeableConcept
* extension[toxicity].valueCodeableConcept from $regimen-discontinued-toxicity-vs (preferred)