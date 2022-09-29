Instance: exSmallCellCancer
//InstanceOf: AnCondition
InstanceOf: an-condition
Title: "Small cell lung cancer diagnosis"
Usage: #example

* subject = Reference(exPatient)
* identifier.system = "http://vendor.org/condition"
* identifier.value = "001"

* code = $snomed#3254632001 "Small cell carcinoma of lung (disorder)"
* evidence.detail = Reference(exSmallCellCancerHistology)


//--------------------------------
Instance: exSmallCellCancerHistology
InstanceOf: ObservationHistology
Title: "Histology: Small cell lung cancer"
Usage: #example

* subject = Reference(exPatient)
* status = #final

* identifier.system = "http://vendor.org/observation"
* identifier.value = "001"

//
* code = $snomed#82231000004111 "Histologic type of primary malignant neoplasm (observable entity)"
* valueString = "Here are the histology findings"

//* code = $snomed#74364000 "Small cell carcinoma (morphologic abnormality)"


// ===========  staging information ===========

Instance: excT1
InstanceOf: ObservationCT
Title: "Clincial T value"
Usage: #example

* subject = Reference(exPatient)
* status = #final
                
* code = $snomed#1778907013
* valueString = "T2"

//---------
Instance: excN1
InstanceOf: ObservationCN
Title: "Clincial N value"
Usage: #example

* subject = Reference(exPatient)
* status = #final

* code = $snomed#1778921010
* valueString = "N2"

// ---------
Instance: excM1
InstanceOf: ObservationCM
Title: "Clincial M value"
Usage: #example

* subject = Reference(exPatient)
* status = #final

* code = $snomed#1778835013
* valueString = "M0"

// ---------
Instance: excTNM1
InstanceOf: ObservationClinTNMGroup
Title: "Clincial TNM group"
Usage: #example

* subject = Reference(exPatient)
* status = #final
* code = $snomed#1786868015

* valueString = "group value"