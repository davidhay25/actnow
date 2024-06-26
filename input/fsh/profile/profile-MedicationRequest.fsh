/*
    Represents a prescription given to the patient
*/


Profile:        AnMedicationRequest
Parent:         MedicationRequest
Id:             an-medication-request
Title:          "ACT-NOW medication request"
Description:    "ACT-NOW medication request. These are prescriptions given to the patient."

* ^url = $profMedicationRequest
* ^jurisdiction.coding = urn:iso:std:iso:3166#NZ

* identifier 1..*   //identifier required for updates

/*
//todo - this is a link to the cycle care plan. Will we accept meds that don't have this?
//? create a slice on SI to define this
* supportingInformation 1..*

* extension contains
    $extCycleDay  named cycle-day  0..1 and        //planned and administered date
    $extPlannedDose named planned-dose 0..1 and     //planned dose
    $extDoseAdjustmentReason named dose-adjustment-reason 0..1  //the reason the dose was adjusted from what was planned

* identifier 1..*
* effective[x] only Period   //As there should always be a start and end time
* effectivePeriod 1..1          //and it is required

*/