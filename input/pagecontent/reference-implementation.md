
To support the development of the Guide, a Reference Implementation (RI) has been created that can store resources in the defined format in a standard FHIR server, and then render them in an 'example' user Interface through the [query API](api-query.html).

Populated with real (but de-personalized) data, it shows the resources - and the references between those resources - in a graphical manner, to assist with understanding the details of the guide.

The RI exposes both a User Interface and API (validation and Submission).


### User Interface

The User Interface of the application can be viewed at [this link](https://actnow.canshare.co.nz/) and consists of a number of tabs, the more important of which are described below. Note that the application is in constant development, so may not completely reflect the description here.

As there is only a small number of patients in the application, they are displayed in a dropdown control. Selecting a patient retrieves all of their data (using the [$everything operation](http://hl7.org/fhir/patient-operation-everything.html)) and then renders the different views from these resources. This is likely a similar approach that a 'real' application could take, though there are other queries defined in this guide.

Patient selection by identifier will be added.

#### Resource graph
The graph tab shows the resources from the selected patient displayed as a graph with boxes representing the resource instances and lines between them representing the references. Clicking on any of the resource instances will display the json view of the resource in the right hand pane.

<img style="width:800px; float:none" src="angraph.png"/>

#### Timeline view
This presents the medications along a timeline of administration date. Selecting an administration (the square box in the timeline) will display the resource to the right.

<img style="width:800px; float:none" src="timeline.png"/>

#### Cycles view
Displays the cycles of treatment in a tabluar format. Both CarePlan and MedicationAdministration / MedicationRequest can be displayed.

<img style="width:800px; float:none" src="cycles.png"/>



### Validation endpoint
To assist with development, the RI exposes a validation endpoint that accepts a bundle, and performs validation without saving the data in the server.

### Submission endpoint
An endpoint that receives a bundle and saves the data in the server (assuming that it passes validation). Once successfully saved, the patient can be retrieved in the User Interface, and the resources and references examined.


