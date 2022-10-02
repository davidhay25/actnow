//from the mosaic csv data

//updated manually to ensure compliance

Instance: G08462-F-24844
InstanceOf: CareplanRegimen
Usage: #example

* meta.versionId = "1"
* meta.lastUpdated = "2022-08-28T18:07:59.239+00:00"
* meta.source = "#3sHtV7KvS7g3vpoI"
* extension[0].url = "http://clinfhir.com/fhir/StructureDefinition/canshare-original-data"
* extension[=].valueString = "[\"G08462-F-24844\",\"1\",\"5\",\"Palliative\",\"CAPEOX\",\"CAPEOX\",\"8/04/2014\",\"1/10/2014\",\"Y\",\"8\",\"\",\"\",\"C189\",\"Colon - unspecified                                                             \",\"\",\"81406\",\"\",\"1\",\"T0\",\"N0\",\"M1b\",\"IVB\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]"

* extension[+].url = "http://clinfhir.com/fhir/StructureDefinition/canshare-cycle-count"
* extension[=].valueInteger = 8

* extension[+].url = "http://canshare.co.nz/fhir/StructureDefinition/tx-intent"
* extension[=].valueCodeableConcept.text = "Palliative"

* identifier.system = "http://example.org"
* identifier.value = "xxx"


//* partOf = Reference(CarePlan/pat-G08462-F-24844)
* status = #completed
* intent = #order
* category = http:example.org#regimen
* title = "CAPEOX"
* subject = Reference(Patient/G08462-F-24844)
* period.start = "2014-04-08"
* period.end = "2014-10-01"
* addresses = Reference(Condition/G08462-F-24844)
* supportingInfo = Reference(Observation/G08462-F-24844tnm-clin-stage)