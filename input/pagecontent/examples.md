Examples are found in a number of places in the guide.

* There is a list of them in the [list of artifacts](artifacts.html#example-example-instances)

* Each profile and extension page has related examples in a tab at the top of the page as well as links from the introduction.

### Example transaction bundles

The example bundles below show 2 transactions:
* the first shows a new regimen and cycle plan with an Observation
* the second shows a MedicationAdministration being added.

Things to note:
* Each bundle contains all resources referenced by any resource within that bundle. This allows the server to resolve all references internally without the client needing to know what the resource id's are.
* If a resource (based on its identifier) does not exist then it will be created, otherwise it will be updated. This means that the resources on the server are always the most recent - they match what is on the client.
* Using identifiers means that each client has it's own separate 'set' of resources. Provided that it supplies the correct system element, resources from one client will not overwrite resources from another. This can mean duplication of resources (like the Patient resource), but the identifiers can be used to resolve this - for example, a Patient will have at least 2 identifiers - one being the unique one from the client and the other the NHI. 
  * An alternative would be for these 'common' resource types to only use the national identifiers - not client specific ones.

**At the time of writing, the examples are currently not necessarily compliant as the validation is still being determined.**

<div class='row'>
    <div class='col-6'>
     <div>This bundle represents a new cycle and contains a Patient, Cycle CarePlan and Observation</div>
     <br/>
        <pre>{
  "resourceType": "Bundle",
  "type": "transaction",
  "entry": [
    {
      "fullUrl": "urn:uuid:07f6169c-7c8c-46b9-b5c1-18b54dd23e1d",
      "resource": {
        "resourceType": "Patient",
        "name": [
          {
            "text": "John Doe"
          }
        ],
        "gender": "male",
        "identifier": [
          {
            "system": "http://clinfhir.com",
            "value": "patient5"
          }
        ],
        "id": "07f6169c-7c8c-46b9-b5c1-18b54dd23e1d",
        "meta": {
          "profile": [
            "http://canshare.co.nz/fhir/StructureDefinition/an-patient"
          ]
        }
      },
      "request": {
        "method": "PUT",
        "url": "Patient?identifier=http://clinfhir.com|patient5"
      }
    },
    {
      "fullUrl": "urn:uuid:28b7f9d9-6a07-4fe9-a951-f7f5afd0e566",
      "resource": {
        "resourceType": "CarePlan",
        "status": "active",
        "intent": "plan",
        "identifier": [
          {
            "system": "http://clinfhir.com",
            "value": "cp5"
          }
        ],
        "meta": {
          "profile": [
            "http://canshare.co.nz/fhir/StructureDefinition/an-careplan-regimen"
          ]
        },
        "id": "28b7f9d9-6a07-4fe9-a951-f7f5afd0e566",
        "title": "Regimen CarePlan",
        "category": [
          {
            "coding": [
              {
                "system": "http://unknown.org",
                "code": "regimenCP"
              }
            ]
          }
        ],
        "subject": {
          "reference": "urn:uuid:07f6169c-7c8c-46b9-b5c1-18b54dd23e1d"
        }
      },
      "request": {
        "method": "PUT",
        "url": "CarePlan?identifier=http://clinfhir.com|cp5"
      }
    },
    {
      "fullUrl": "urn:uuid:b9f5ff7e-e270-41ad-ba41-fa7c7d33e607",
      "resource": {
        "resourceType": "CarePlan",
        "status": "active",
        "intent": "plan",
        "identifier": [
          {
            "system": "http://clinfhir.com",
            "value": "cp5"
          }
        ],
        "meta": {
          "profile": [
            "http://canshare.co.nz/fhir/StructureDefinition/an-careplan-cycle"
          ]
        },
        "id": "b9f5ff7e-e270-41ad-ba41-fa7c7d33e607",
        "title": "Cycle CarePlan",
        "category": [
          {
            "coding": [
              {
                "system": "http://unknown.org",
                "code": "cycleCP"
              }
            ]
          }
        ],
        "partOf": [
          {
            "reference": "urn:uuid:28b7f9d9-6a07-4fe9-a951-f7f5afd0e566"
          }
        ],
        "subject": {
          "reference": "urn:uuid:07f6169c-7c8c-46b9-b5c1-18b54dd23e1d"
        }
      },
      "request": {
        "method": "PUT",
        "url": "CarePlan?identifier=http://clinfhir.com|cp5"
      }
    },
    {
      "fullUrl": "urn:uuid:08fd8840-9059-451e-9566-6682d130de22",
      "resource": {
        "resourceType": "Observation",
        "status": "final",
        "identifier": [
          {
            "system": "http://clinfhir.com",
            "value": "bsa5"
          }
        ],
        "id": "08fd8840-9059-451e-9566-6682d130de22",
        "code": {
          "coding": [
            {
              "system": "http://loinc.org",
              "code": "8277-6"
            }
          ]
        },
        "valueQuantity": {
          "value": 1.96,
          "unit": "m2",
          "system": "http://unitsofmeasure.org"
        },
        "effectiveDateTime": "2014-04-08T09:35:00Z",
        "focus": [
          {
            "reference": "urn:uuid:b9f5ff7e-e270-41ad-ba41-fa7c7d33e607"
          }
        ],
        "subject": {
          "reference": "urn:uuid:07f6169c-7c8c-46b9-b5c1-18b54dd23e1d"
        }
      },
      "request": {
        "method": "PUT",
        "url": "Observation?identifier=http://clinfhir.com|bsa5"
      }
    }
  ]
}
        </pre>
    </div>



    <div class='col-6'>
        <div>This bundle adds a MedicationAdministration. Note that the Patient and cycle plan are included, even though they have not been updated.</div><br/>
        <pre>{
  "resourceType": "Bundle",
  "type": "transaction",
  "entry": [
    {
      "fullUrl": "urn:uuid:07f6169c-7c8c-46b9-b5c1-18b54dd23e1d",
      "resource": {
        "resourceType": "Patient",
        "name": [
          {
            "text": "John Doe"
          }
        ],
        "gender": "male",
        "identifier": [
          {
            "system": "http://clinfhir.com",
            "value": "patient5"
          }
        ],
        "id": "07f6169c-7c8c-46b9-b5c1-18b54dd23e1d",
        "meta": {
          "profile": [
            "http://canshare.co.nz/fhir/StructureDefinition/an-patient"
          ]
        }
      },
      "request": {
        "method": "PUT",
        "url": "Patient?identifier=http://clinfhir.com|patient5"
      }
    },
    {
      "fullUrl": "urn:uuid:28b7f9d9-6a07-4fe9-a951-f7f5afd0e566",
      "resource": {
        "resourceType": "CarePlan",
        "status": "active",
        "intent": "plan",
        "identifier": [
          {
            "system": "http://clinfhir.com",
            "value": "cp5"
          }
        ],
        "meta": {
          "profile": [
            "http://canshare.co.nz/fhir/StructureDefinition/an-careplan-regimen"
          ]
        },
        "id": "28b7f9d9-6a07-4fe9-a951-f7f5afd0e566",
        "title": "Regimen CarePlan",
        "category": [
          {
            "coding": [
              {
                "system": "http://unknown.org",
                "code": "regimenCP"
              }
            ]
          }
        ],
        "subject": {
          "reference": "urn:uuid:07f6169c-7c8c-46b9-b5c1-18b54dd23e1d"
        }
      },
      "request": {
        "method": "PUT",
        "url": "CarePlan?identifier=http://clinfhir.com|cp5"
      }
    },
    {
      "fullUrl": "urn:uuid:b9f5ff7e-e270-41ad-ba41-fa7c7d33e607",
      "resource": {
        "resourceType": "CarePlan",
        "status": "active",
        "intent": "plan",
        "identifier": [
          {
            "system": "http://clinfhir.com",
            "value": "cp5"
          }
        ],
        "meta": {
          "profile": [
            "http://canshare.co.nz/fhir/StructureDefinition/an-careplan-cycle"
          ]
        },
        "id": "b9f5ff7e-e270-41ad-ba41-fa7c7d33e607",
        "title": "Cycle CarePlan",
        "category": [
          {
            "coding": [
              {
                "system": "http://unknown.org",
                "code": "cycleCP"
              }
            ]
          }
        ],
        "partOf": [
          {
            "reference": "urn:uuid:28b7f9d9-6a07-4fe9-a951-f7f5afd0e566"
          }
        ],
        "subject": {
          "reference": "urn:uuid:07f6169c-7c8c-46b9-b5c1-18b54dd23e1d"
        }
      },
      "request": {
        "method": "PUT",
        "url": "CarePlan?identifier=http://clinfhir.com|cp5"
      }
    },
    {
      "fullUrl": "urn:uuid:605c0235-19b7-47c6-9927-d4b39f5c929f",
      "resource": {
        "resourceType": "MedicationAdministration",
        "status": "completed",
        "identifier": [
          {
            "system": "http://clinfhir.com",
            "value": "ma5"
          }
        ],
        "medicationCodeableConcept": {
          "text": "drug 1"
        },
        "effectiveDateTime": "2022-01-01",
        "supportingInformation": [
          {
            "reference": "urn:uuid:b9f5ff7e-e270-41ad-ba41-fa7c7d33e607"
          }
        ],
        "meta": {
          "profile": [
            "http://canshare.co.nz/fhir/StructureDefinition/canshare-medication-administration"
          ]
        },
        "id": "605c0235-19b7-47c6-9927-d4b39f5c929f",
        "subject": {
          "reference": "urn:uuid:07f6169c-7c8c-46b9-b5c1-18b54dd23e1d"
        }
      },
      "request": {
        "method": "PUT",
        "url": "MedicationAdministration?identifier=http://clinfhir.com|ma5"
      }
    }
  ]
}</pre>
    
    



</div>

    