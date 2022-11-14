
/*
    The number of cycles of treatment given for a regimen.
    Note that this is on the Observation that records the ourcome of the
    regimen - not on the regimen itself (though that could be challenged)

*/


Extension: CourseNumber
Id: an-course-number
Description: "The course number (sequential number) for this regimen"
* ^url = $extCourseNumber
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ


* ^context[+].type = #element
* ^context[=].expression = "CarePlan"

* ^status = #draft

* value[x] only integer