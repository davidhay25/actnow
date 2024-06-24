Extension: DependsOn
Id: canshare-depends-on
Description: "Indicates the type of comparison performed when ecaluating the target 'depends-on' value if it is not simple equality"

* ^url = "http://canshare.co.nz/fhir/StructureDefinition/do-operator"
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* ^context[+].type = #element
* ^context[=].expression = "ConceptMap.group.element.target.dependsOn"

* ^status = #draft
* ^version = "1"

* value[x] only code



