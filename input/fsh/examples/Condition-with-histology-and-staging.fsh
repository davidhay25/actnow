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
* code = $snomed#512001000004108 "Histologic type of primary malignant neoplasm (observable entity)"


* valueCodeableConcept = $snomed#447881000210103 "Acral melanoma"


//* code = $snomed#74364000 "Small cell carcinoma (morphologic abnormality)"


// ===========  clinical staging information ===========

Instance: excT1
InstanceOf: ObservationCT
Title: "Clinical T value"
Usage: #example

* meta.profile = $cT

* subject = Reference(exPatient)
* status = #final
                
* code = $snomed#399504009
* valueCodeableConcept.text = $snomed#1228929004 "American Joint Committee on Cancer cT2 (qualifier value)"

//---------
Instance: excN1
InstanceOf: ObservationCN
Title: "Clincial N value"
Usage: #example

* meta.profile = $cN


* subject = Reference(exPatient)
* status = #final

* code = $snomed#399534004
* valueCodeableConcept = $snomed#1229967007 "American Joint Committee on Cancer cN0 (qualifier value)"

// ---------
Instance: excM1
InstanceOf: ObservationCM
Title: "Clincial M value"
Usage: #example

* meta.profile = $cM

* subject = Reference(exPatient)
* status = #final

* code = $snomed#399387003
* valueCodeableConcept = $snomed#1229903009 "American Joint Committee on Cancer cM1 (qualifier value)"

// ---------
Instance: excTNM1
InstanceOf: ObservationClinTNMGroup
Title: "Clinical TNM group"
Usage: #example

* meta.profile = $cGroup

* subject = Reference(exPatient)
* status = #final
* code = $snomed#399537006

* valueCodeableConcept = $snomed#1222765007 "American Joint Committee on Cancer stage II (qualifier value)"


// ===========  Pathological staging information ===========

Instance: expT1
InstanceOf: ObservationPT
Title: "Pathological T value"
Usage: #example

* meta.profile = $pT

* subject = Reference(exPatient)
* status = #final
                
* code = $snomed#399588009
* valueCodeableConcept = $snomed#1228957006 "American Joint Committee on Cancer pT1 (qualifier value)"

//---------
Instance: expN1
InstanceOf: ObservationPN
Title: "Pathological N value"
Usage: #example

* meta.profile = $pN

* subject = Reference(exPatient)
* status = #final

* code = $snomed#371494008
* valueCodeableConcept = $snomed#1229951001 "American Joint Committee on Cancer pN1 (qualifier value)"

// ---------
Instance: expM1
InstanceOf: ObservationPM
Title: "Pathological M value"
Usage: #example

* meta.profile = $pM

* subject = Reference(exPatient)
* status = #final

* code = $snomed#371497001
* valueCodeableConcept = $snomed#1229916009 "American Joint Committee on Cancer pM1 (qualifier value)"

// ---------
Instance: expTNM1
InstanceOf: ObservationPathTNMGroup
Title: "Pathological TNM group"
Usage: #example

* meta.profile = $pGroup

* subject = Reference(exPatient)
* status = #final
* code = $snomed#399588009 

* valueCodeableConcept = $snomed#1222837003 "American Joint Committee on Cancer stage IV (qualifier value)"