Instance: supporting-info
InstanceOf: SearchParameter 
Description: "Searches for supportingInfo references"

* url = "http://canshare.com/supportinginfo"
* name = "Supporting Info"
* status = #active
* description = "Supporting Info"
* code = #supporting-info
* base = #CarePlan
* type = #reference
* expression = "CarePlan.supportingInfo"
* target = #Observation