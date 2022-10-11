Instance: AnCapabilityStatement
InstanceOf: CapabilityStatement 
Description: "Server capability statement"
Usage: #definition

* name = "CanShareCapabilityStatement"
* title = "CapabilityStatement representing the server requirements for a FHIR server"
* description = "Describes the server requirements for ACT-NOW"
* status = #draft
* date = "2022-10-03"
* publisher = "David Hay"
* kind = #requirements
* fhirVersion = #4.0.1
* format = #json
* rest.mode = #server

* rest.interaction[+].code = #transaction


* rest.resource[+].type = #Patient
* rest.resource[=].supportedProfile = "http://canshare.co.nz/fhir/StructureDefinition/an-patient"
* rest.resource[=].interaction[+].code = #read
* rest.resource[=].interaction[=].code = #update
* rest.resource[=].interaction[=].code = #create
* rest.resource[=].interaction[=].code = #search-type
* rest.resource[=].conditionalUpdate = true
* rest.resource[=].conditionalCreate = true
* rest.resource[=].searchParam[+].name = "identifier"
* rest.resource[=].searchParam[=].type = #token

* rest.resource[=].searchParam[+].name = "name"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[+].name = "gender"
* rest.resource[=].searchParam[=].type = #token

* rest.resource[+].type = #Practitioner
* rest.resource[=].supportedProfile = "http://canshare.co.nz/fhir/StructureDefinition/an-practitioner"
* rest.resource[=].interaction[+].code = #read
* rest.resource[=].interaction[=].code = #update
* rest.resource[=].interaction[=].code = #create
* rest.resource[=].interaction[=].code = #search-type
* rest.resource[=].conditionalUpdate = true
* rest.resource[=].conditionalCreate = true
* rest.resource[=].searchParam[+].name = "identifier"
* rest.resource[=].searchParam[=].type = #token

* rest.resource[=].searchParam[+].name = "name"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[+].name = "gender"
* rest.resource[=].searchParam[=].type = #token


* rest.resource[+].type = #CarePlan
* rest.resource[=].supportedProfile[+] = "http://canshare.co.nz/fhir/StructureDefinition/an-careplan-regimen"
* rest.resource[=].supportedProfile[+] = "http://canshare.co.nz/fhir/StructureDefinition/an-careplan-cycle"
* rest.resource[=].interaction[+].code = #read
* rest.resource[=].interaction[=].code = #update
* rest.resource[=].interaction[=].code = #create
* rest.resource[=].interaction[=].code = #search-type
* rest.resource[=].conditionalUpdate = true
* rest.resource[=].conditionalCreate = true
//* rest.resource[=].conditionalDelete = true
* rest.resource[=].searchParam[+].name = "identifier"
* rest.resource[=].searchParam[=].type = #token

* rest.resource[+].type = #Observation
// ? add all profiles * rest.resource[=].supportedProfile = "http://canshare.co.nz/fhir/StructureDefinition/an-careplan-regimen"

* rest.resource[=].supportedProfile[+] = $cT
* rest.resource[=].supportedProfile[+] = $cN
* rest.resource[=].supportedProfile[+] = $cM
* rest.resource[=].supportedProfile[+] = $cGroup

* rest.resource[=].supportedProfile[+] = $pT
* rest.resource[=].supportedProfile[+] = $pN
* rest.resource[=].supportedProfile[+] = $pM
* rest.resource[=].supportedProfile[+] = $pGroup

* rest.resource[=].supportedProfile[+] = $bsa
* rest.resource[=].supportedProfile[+] = $creat-clear
* rest.resource[=].supportedProfile[+] = $height
* rest.resource[=].supportedProfile[+] = $weight
* rest.resource[=].supportedProfile[+] = $histology
* rest.resource[=].supportedProfile[+] = $ecog
//* rest.resource[=].supportedProfile[+] = ""


* rest.resource[=].interaction[+].code = #read
* rest.resource[=].interaction[=].code = #update
* rest.resource[=].interaction[=].code = #create
* rest.resource[=].interaction[=].code = #search-type
* rest.resource[=].conditionalUpdate = true
* rest.resource[=].conditionalCreate = true
//* rest.resource[=].conditionalDelete = true
* rest.resource[=].searchParam[+].name = "identifier"
* rest.resource[=].searchParam[=].type = #token

* rest.resource[+].type = #MedicationAdministration
* rest.resource[=].supportedProfile[+] = "http://canshare.co.nz/fhir/StructureDefinition/an-medication-administration"
* rest.resource[=].interaction[+].code = #read
* rest.resource[=].interaction[=].code = #update
* rest.resource[=].interaction[=].code = #create
* rest.resource[=].interaction[=].code = #search-type
* rest.resource[=].conditionalUpdate = true
* rest.resource[=].conditionalCreate = true
//* rest.resource[=].conditionalDelete = true
* rest.resource[=].searchParam[+].name = "identifier"
* rest.resource[=].searchParam[=].type = #token

* rest.resource[+].type = #MedicationRequest
* rest.resource[=].supportedProfile[+] = "http://canshare.co.nz/fhir/StructureDefinition/an-medication-request"
* rest.resource[=].interaction[+].code = #read
* rest.resource[=].interaction[=].code = #update
* rest.resource[=].interaction[=].code = #create
* rest.resource[=].interaction[=].code = #search-type
* rest.resource[=].conditionalUpdate = true
* rest.resource[=].conditionalCreate = true
//* rest.resource[=].conditionalDelete = true
* rest.resource[=].searchParam[+].name = "identifier"
* rest.resource[=].searchParam[=].type = #token