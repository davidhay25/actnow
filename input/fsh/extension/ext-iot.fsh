Extension: IOT
Id: an-iot
Description: "Intent of treatment"

* ^url = $iot
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^context[+].type = #element
* ^context[=].expression = "CarePlan"

* ^status = #draft

* value[x] only CodeableConcept
* valueCodeableConcept from $regimen-iot-vs (required)