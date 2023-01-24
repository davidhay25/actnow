Instance: exSmallCellCancer
//InstanceOf: AnCondition
InstanceOf: an-condition
Title: "Small cell lung cancer diagnosis"
Usage: #example

* meta.profile = $profCondition

* subject = Reference(exPatient)
* identifier.system = "http://vendor.org/condition"
* identifier.value = "001"

* extension[+].url = $extRecurrenceType
* extension[=].valueCodeableConcept = $snomed#372288004 "Local tumor invasion (finding)"


* code = $snomed#3254632001 "Small cell carcinoma of lung (disorder)"
* bodySite[+].text = "Left lung"

* evidence.detail = Reference(exSmallCellCancerHistology)
* evidence[+].code = $snomed#373795004	"Cancer diagnosis based on clinical evidence (finding)"

//--------------------------------
Instance: exSmallCellCancerHistology
InstanceOf: ObservationHistology
Title: "Histology: Small cell lung cancer"
Usage: #example

* meta.profile = $histology

* subject = Reference(exPatient)
* status = #final

* identifier.system = "http://vendor.org/observation"
* identifier.value = "001"

//
* code = $snomed#82231000004111 "Histologic type of primary malignant neoplasm (observable entity)"
* valueString = "Here are the histology findings"

//* code = $snomed#74364000 "Small cell carcinoma (morphologic abnormality)"


// ===========  clinical staging information ===========

Instance: excT1
InstanceOf: ObservationCT
Title: "Clinical T value"
Usage: #example

* meta.profile = $cT

* subject = Reference(exPatient)
* status = #final
                
* code = $snomed#1778907013
* valueCodeableConcept.text = "T2"

//---------
Instance: excN1
InstanceOf: ObservationCN
Title: "Clincial N value"
Usage: #example

* meta.profile = $cN


* subject = Reference(exPatient)
* status = #final

* code = $snomed#1778921010
* valueCodeableConcept.text = "N2"

// ---------
Instance: excM1
InstanceOf: ObservationCM
Title: "Clincial M value"
Usage: #example

* meta.profile = $cM

* subject = Reference(exPatient)
* status = #final

* code = $snomed#1778835013
* valueCodeableConcept.text = "M0"

// ---------
Instance: excTNM1
InstanceOf: ObservationClinTNMGroup
Title: "Clinical TNM group"
Usage: #example

* meta.profile = $cGroup

* subject = Reference(exPatient)
* status = #final
* code = $snomed#1786868015

* valueCodeableConcept.text = "group value"


// ===========  Pathological staging information ===========

Instance: expT1
InstanceOf: ObservationPT
Title: "Pathological T value"
Usage: #example

* meta.profile = $pT

* subject = Reference(exPatient)
* status = #final
                
* code = $snomed#1786872016
* valueCodeableConcept.text = "T2"

//---------
Instance: expN1
InstanceOf: ObservationPN
Title: "Pathological N value"
Usage: #example

* meta.profile = $pN

* subject = Reference(exPatient)
* status = #final

* code = $snomed#1478165014
* valueCodeableConcept.text = "N2"

// ---------
Instance: expM1
InstanceOf: ObservationPM
Title: "Pathological M value"
Usage: #example

* meta.profile = $pM

* subject = Reference(exPatient)
* status = #final

* code = $snomed#1478167018
* valueCodeableConcept.text = "M0"

// ---------
Instance: expTNM1
InstanceOf: ObservationPathTNMGroup
Title: "Pathological TNM group"
Usage: #example

* meta.profile = $pGroup

* subject = Reference(exPatient)
* status = #final
* code = $snomed#1786868015 

* valueCodeableConcept.text = "group value"