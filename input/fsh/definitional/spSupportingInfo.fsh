Instance: an-supporting-info
InstanceOf: SearchParameter 
Description: "Searches for supportingInfo references"
Usage: #definition

* url = "http://canshare.co.nz/fhir/SearchParameter/an-supporting-info"
* name = "cp-supporting-info"
* status = #active
* description = "Supporting Info"
* code = #supporting-info
* base = #CarePlan
* type = #reference
* expression = "CarePlan.supportingInfo"
* target = #Observation
* target[+] = #Condition