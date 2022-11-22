


### Background


There are at least a couple of options for the input API using the RESTful API.


#### Direct REST updates

The direct REST API involves the the client making individual API calls for each interaction. For example, to record that a medication was given, then client retrieves the appropriate patient Id and cycle CarePlan id, creates the MedicationAdministratoion resource with the appropriate references, and POSTs the MedicationAdministration to the server. This results in an extremely 'chatty' API interaction, with a increased risk of client errors leading to data corruption if the wrong resource is created or updated or incorrect reference resources are chosen. 

This can be mitigated to some degree if each client had its own server and/or has control over the resource ids (updating using the PUT interaction), at the expense of increased system complexity.

#### Transactions using conditional operations

In this scenario, all interactions are by using Transaction bundles, where updates and references to other resources can be determined by their identifier using
[conditional creates](http://hl7.org/fhir/http.html#ccreate) or 

 [conditional updates](http://hl7.org/fhir/http.html#cond-update). This has the advantage of off loading much of the work to the server and allows multiple resources to be created / updated in a single interaction. 

While it does require the client to maintain the unique identifiers (the resource element identifier - not the resource id), this is much simpler and safer to manage than having to use the resource id especially when different clients are updating the server. The supplier still needs to maintain unique identifier values, but this is made easier by using unique 'system' values for each supplier.

This is the approach taken in this guide, as seen in the following diagram


<img style="width:800px; float:none" src="inputAPI.png"/>

1. The sender creates a transaction bundle with data that needs to be updated. This can be either new resources or updates to existing ones. All resources referenced in the bundle are present, and any resource ids and references are replaced by UUIDs. All resources must have an identifier.
1. The validator parses the bundle against the profiles in this IG. If there ae any validation failures, the bundle is rejected. The sender will need to correct and re-submit.
1. The bundle is passed to the transaction endpoint of the FHIR server and processed acording to the FHIR rules. As the bundle has been validated, no validation errors should occur unless there has been a previous error and identifiers have been duplicated. This is why direct restful updates are blocked. In this scenario, an administrator should delete all resources with that identifier and re-process the Transaction bundle to add the correct resource. 


### Details of Conditional operations
<!--
> Considering that when there is an update the entire patient record is transmitted in the bundle
> and that each bundle is a single patient (though not really required)
> reason is that a number of the resource extensions mean that the resource needs to be updated
> for example the regimen cycle count extension will start at 1 and increment each time a new
> cycle is established

> Need to consider the impact on the extract for analytics
-->

This section describes how data is sent from client applications to the system, assuming that conditional updates can be used.

The current API uses [conditional updates](http://hl7.org/fhir/http.html#cond-update) (sometimes known as an [upsert](https://en.wiktionary.org/wiki/upsert)) in a [FHIR transaction](http://hl7.org/fhir/http.html#transaction) to receive data from suppliers. The resource [identifier](http://hl7.org/fhir/datatypes.html#Identifier) is the element used to discriminate during the update or create operation. The bundle contains all resources referenced by any other resource within the bundle, and uses UUID's as resource ids.

In some cases, [conditional create](http://hl7.org/fhir/http.html#ccreate) may also used where the resource must be present in the bundle to allow the server to resolve the resource ids for referencing, but the resource is not intended to be updated if already present. The Patient resource is an example where this might be appropriate.

[Conditional delete](http://hl7.org/fhir/http.html#3.1.0.7.1) operations are not used, as errors can be managed with appropriate resource status updates and a Conditional update.

#### Resource identifier as the identity key

> add note that the NHI mst be used in the conditional operation

<!--Given that the system potentially needs to perform updates of resources (rather than simply supplying resources for storage and subsequent retrieval), a key consideration is how a client can identify the resource that needs updating. The most obvious example of this is the CarePlan (regimen and cycle) resource, whose status changes as treatment progresses.

One way that this can be done is to use the [resource id](http://hl7.org/fhir/element-definitions.html#Element.id) - an element that all resources possess. However, assigning the id can become complex when multiple systems need to interact with the same resource and the risk of inadvertently altering the wrong resources needs to be carefully considered. 

An alternative approach is to use the identifier element - which most resources (including the ones needed by this Guide) support. In all cases where a resource type has an identifier element there can be multiple ones.
-->
An identifier is an alternate way of identifying a resource. Unlike the resource id, the value of the identifier does not change if the resource is moved between servers (it is considered a business identifier rather than a structural/logical one which is the id).

Note that the identifier element has a datatype of [identifier](http://hl7.org/fhir/datatypes.html#Identifier) as well the name.

The identifier datatype is a complex datatype and has number of child elements, of which 2 are the most useful - system and value.

The *identifier.system* element describes the domain within which the *identifier.value* is unique. Existing examples are medical record numbers, passport numbers and driving license.

Each potential supplier of information will be assigned a system value (which is a url). Alternatively, if the supplier has one which is not being used by any other supplier then that could be used.

The same system could be used for any resource type, providing that the value remains unique within that system. Alternatively a separate system per resource type could be used.

The *identifier.value* element contains the actual value of the identifier - eg the NHI number.

#### API

<!--
When creating or updating resources through the RESTful API, one approach is for the client to directly update the resources as required. However, this leads to quite a 'chatty' interaction requiring multiple REST calls to create. This guide uses an alternative approach, where the resources to be created or updated are placed in a [FHIR Bundle](http://hl7.org/fhir/bundle.html) and submitted as a unit to the server for processing. There are a number of ways that this could be performed, but the [transaction](http://hl7.org/fhir/http.html#transaction) is the one chosen here.
-->
The Bundle is a FHIR resource that contains resources within Entry elements. Each entry has the resource to be updated, and other metadata as required for the particular operation.

To support the need to update based on the resource identifier, [conditional updates](http://hl7.org/fhir/http.html#cond-update) are required for all resources in the bundle. 

In a conditional update (sometimes called an 'upsert'), the entry contains a number of specific elements:
* the entry.fullUrl must be populated. In this guide it will be the string "urn:uuid:" followed by the resource.id (as all ids are UUIDs). 
* the entry.resource element contains the actual resource. It may or may not have an id, but must have an identifier.
* the entry.request element has 2 children that need to be populated:
    * entry.request.method - this is set to 'PUT'
    * entry.request.url - this is set to a query that would identify the resource (if it exists on the target server). Commonly (and in this guide) it is based on the identifier. 
        * If there is no resource matching this query, then one is created on the server. 
        * If there is one matching resource, then it is updated by the resource in the bundle. 
        * If there is more than one resource that matches, this is an error condition and the transaction fails.

Here's an example of a CarePlan with an identifier with a system value of http://example.org and a value of abc1234 being created or updated. 

```
  "entry": [
    {
      "fullUrl": "urn:uuid:ad9ae703-e6a3-41f7-90e8-b6f6ff9e3742",
      "resource" : {....},
      "request" : {
        "method":"PUT",
        "url": "CarePlan?identifier=http://example.org|abc1234"
      }
    }
  ]

```

> need to think further about 'planned' resources coming through and what to do when that changes.

> notes on which med resource to use (mad admin vs med request). Issue is that 'planned' resources are being sent through

> deleting data - eg if regimen changes. 

#### Bundle layout

A bundle containing resources to be saved in the server can have any number of resources. The following constraints apply.

##### Resource ids and references should be a uuid. 

The [uuid](http://hl7.org/fhir/datatypes.html#uuid)(Universally Unique ID) is used as a unique id within the bundle, including references between resource (ie to reference another resource you use the uuid)

The server will locate an existing resource based on the identifier or create a new one if none exist as described above. The server will then update the references between resources to use that id internally,

Here's an example of resources and resource references in a sample bundle. Note the presence of the 'fullUrl' element in the bundle which must be present (it matches the id).

```
{
  "resourceType": "Bundle",
  "type": "transaction",
  "entry": [
    {
      "fullUrl": "urn:uuid:c0f81fc6-a8cd-437d-af98-3c1b8e65a264",
      "resource": {
        "resourceType": "Patient",
        "id": "c0f81fc6-a8cd-437d-af98-3c1b8e65a264"
        "identifier": [
          {
            "system": "http://clinfhir.com",
            "value": "patient5"
          }
        ],
        ... snip ...
       
      },
      "request": {
        "method": "PUT",
        "url": "Patient?identifier=http://clinfhir.com|patient5"
      }
    },
    {
      "fullUrl": "urn:uuid:ad9ae703-e6a3-41f7-90e8-b6f6ff9e3742",
      "resource": {
        "resourceType": "CarePlan",
         "id": "ad9ae703-e6a3-41f7-90e8-b6f6ff9e3742",
         "identifier": [
          {
            "system": "http://clinfhir.com",
            "value": "cp5"
          }
        ],
        ... snip ...
        "subject": {
          "reference": "urn:uuid:c0f81fc6-a8cd-437d-af98-3c1b8e65a264"
        }
      },
      "request": {
        "method": "PUT",
        "url": "CarePlan?identifier=http://clinfhir.com|cp5"
      }
    },

... snip ...
}

```


##### All resources should have an identifier
As described earlier, the identifier is the mechanism used to locate resources for update if needed.

##### All resources should have a profile declaration
This is needed to support validation on the received data, as the data is being used for analytics and data quality is paramount.

##### All resources referenced by any of the resources in the bundle must be present in the bundle
Even if the resource already exists in the server, it should still be present in the bundle. eg the Patient resource will always be present. This approach makes the overall design much simpler - especially for references as otherwise the client would need to first query the server to locate the target reference id (eg the patient id), then create the source resource.



#### Process to create the bundle
There are a number of strategies for the client to create the bundle, depending on their internal capabilities. At the least, it must maintain unique identifiers for each resource within its database. These may or may not be in the FHIR format as long as they are unique within the clients system, at least within the resource type (so the combination of identifier.system & identifier.value is unique). 

Data can be sent either as new/updates only (incremental) or all data for a patient. The approach taken will depend on whether the client can track internally resources that have been submitted (incremental update) or whether it must send a complete dump of all the data for a patient if there are any changes to that patients data. 

The incremental approach will result in smaller bundles (as only changed resources and resources they reference need to be sent) and will allow allow the server to track changes to resources over time (eg a changing CarePlan status). However, this does add to the complexity of the solution. 

##### Complete patient refresh

If the sender cannot track which resources have been sent to the system, then when any patient data changes, all data needs to be sent (or re-sent) to the server. It is suggested that there should be a single bundle per patient as this will keep the bundle size as small as possible. It also means that if there is a validation error, then only that patient will need to be re-sent.

Here's an example high level flow.

For each patient that has had an update (new or changed data) since the last time a bundle was sent:

* Create the Patient resource. Assign it a UUID, and add to the bundle.
* Create a Condition resource to represent the diagnosis. If there is a histology result that was used to determine the diagnosis, then create an Observation with the histology and a reference from Condition.evidence.detail to the Observation.
* Create the CarePlan resource that represents the regimen. Create a reference to the patient (using the UUID). 
    * If there are any measures that were taken prior to the start of the regimen, create Observations for them and a reference from the carePlan to the Observation using the CarePlan.supportingInfo element
    * If the regimen is complete, then create any 'outcome' Observations and set a reference to the Patient in the Observation.basedOn element. 
* Add CarePlan and Observations to the bundle.
* If there is TNM information to include:
    * Create separate observations for each of the T, N & M values
    * Create a summary Observation that has the TNM value as well, with references to the individual Observations from the Observation.hasMember link
    * Update the regimen CarePlan to add a CarePlan.supportingInfo reference to the summary Observation.
* for each cycle of treatment that has been started or completed:
    * Create a cycle CarePlan
    * Add a CarePlan.partOf reference back to the regimen CarePlan. 
    * If there are any measures that were taken prior to the start of the cycle, create Observations for them and a reference from the carePlan to the Observation using the CarePlan.supportingInfo element
    * If the cycle has been completed (early or not), then create any needed 'outcome' Observations with an Observation.basedOn reference to the cycle CarePlan.
    * for each medication that has been administered or prescribed to a patient as part of the cycle of treatment:
        * Create a MedicationAdministration or MedicationRequest resource, with a 'supportingInformation' reference to the cycle carePlan

##### Incremental updates
In this scenario, the client is able to track which resources have (successfully) been sent to the system and can create bundles that only contain updated or new resources.

The flow is pretty much the same as for the complete patient refresh except that only new or updated resources are included in the bundle. (plus any other resources which they reference - like Patient) 

##### Things to remember
* All resources have an identifier and UUID as the ID.
* All references use the UUID
* All resources are represented as conditional updates in the bundle.
* All resources will have a reference to the patient
* Any resources that are the target of a reference much be included in the bundle, even if they have already been sent to the system and haven't changed since then
* The 'fullUrl' element is required on all entries. It uses the uuid format: 
* Use the 'validate' endpoint supplied by the Reference Implementation during the design phase.


