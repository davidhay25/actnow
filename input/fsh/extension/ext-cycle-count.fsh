
/*
    The number of cycles of treatment given for a regimen.
    Note that this is on the Observation that records the ourcome of the
    regimen - not on the regimen itself (though that could be challenged)

*/


Extension: CycleCount
Id: an-cycle-count
Description: "The number of cycles that administered for a regimen"
* ^url = $extCycleCount //"http://hl7.org.nz/fhir/StructureDefinition/established"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

//should only appear on an observation
* ^context[+].type = #element
* ^context[=].expression = "Observation"

* ^status = #draft

* value[x] only integer