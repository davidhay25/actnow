Instance: exPatient
InstanceOf: AnPatient
Title: "Lorrie Lung"
Description: "Example of a patient. This is a simple example that only includes the required elements and a few optional ones. It is not meant to be a comprehensive example of all the possible elements that could be included in a patient resource."

Usage: #example
* text.status = #generated
* text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>Lorrie Lung</div>"
* birthDate = "1969-02-02"

* name.given = "Lorrie"
* name.family = "Lung"
* name.text = "Lorrie Lung"

//taking out the identifier
* identifier.system = "https://standards.digital.health.nz/ns/nhi-id"
* identifier.value = "WER4568"