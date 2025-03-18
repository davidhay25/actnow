Instance: ExObservationHeight
InstanceOf: ObservationHeight

* meta.profile = $height

* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Height 180 cm</div>"
* text.status = #generated

* subject = Reference(exPatient)
* performer = Reference(exPractitioner) //avoid the warning from the validator
* effectiveDateTime = "2020-01-01"
* status = #final
* identifier.system = "http://canshare.co.nz/identifiers"
* identifier.value = "height"

* category = http://terminology.hl7.org/CodeSystem/observation-category#vital-signs "Vital Signs"

//add 2 codings - one is the required snomed code, the other is an example extra one to demonstrate that others are allowed
* code.coding[snomedCode] = $snomed#1153637007 
* code.coding[loincCode] = $loinc#8302-2

* valueQuantity.value = 180
* valueQuantity.code = #cm
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.unit = "cm"

