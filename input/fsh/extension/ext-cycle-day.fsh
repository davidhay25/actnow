/*
    The day of the cycle that this administration was made on
*/


Extension: CycleDay
Id: an-cycle-day
Description: "The day of the cycle that this medication was given on. Includes planned day and administered day. Not the same as intended cycle length."
* ^url = $extCycleDay
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^context[+].type = #element
* ^context[=].expression = "MedicationAdministration"

* ^status = #draft


* extension contains
    planned 0..1 and
    administered 0..1

* extension[planned].url = "planned" (exactly)
* extension[planned] ^definition = "The day that this administration should have been given on"
* extension[planned] ^short = "Planned date"
* extension[planned].value[x] only integer

* extension[administered].url = "administered" (exactly)
* extension[administered] ^definition = "The day that this administration should have been given on"
* extension[administered] ^short = "Planned date"
* extension[administered].value[x] only integer