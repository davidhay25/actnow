Extension: RecurrenceType
Id: an-recurrence-type
Description: "Recurrence type"

* ^url = $extRecurrenceType
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^context[+].type = #element
* ^context[=].expression = "Condition"

* ^status = #draft

* value[x] only CodeableConcept
* valueCodeableConcept from $recurrence-type-vs (required)   //todo - if this is required, then a code must be present