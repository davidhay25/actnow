#!/usr/bin/env node

//have a json file with mappings for coded data based on a key (eg BMI)
//then a function tgat takes in the key/data and retuirns the CC
//also an 'isNull' function (for NULL)

//todo
// when processing a medication lookup the code from a terminology service (or other). Cache for performance.



const fs = require('fs');
const axios = require('axios').default;

let updateServer = true

//definitions
let regimenCategory = {coding:[{system:"http:canshare.com",code:"regimen"}]}
let cycleCategory = {coding:[{system:"http:canshare.com",code:"cycle"}]}
let extOriginalData = "http://clinfhir.com/fhir/StructureDefinition/canshare-original-data"
let extCycleNumber = "http://clinfhir.com/fhir/StructureDefinition/canshare-cycle-number"
let extDoseAdjustReason = "http://clinfhir.com/fhir/StructureDefinition/canshare-dose-adjustment-reason"

let hashRegimen = {}
let hashCycle  = {}

let arAdministration = []

loadAllData(false)      //load all the data into hashs, ignoring those with a missing reference or duplicate

//now construct the FHIR resources.
//strategy is to create a bundle for each regimen entry - this will be POSTed to the server
//Each bundle will have one regimen level CP, all Cycle CP's that reference that regimen, and all admins that reference that cycle



async function insert() {
    //await insertDataOneRegimen("4121-48770")
    //await insertDataOneRegimen("4121-124154")
    //await insertDataOneRegimen("4121-111315")

    let keys = Object.keys(hashRegimen)

    //first entry are the headers
    for (let i=1; i < 10; i++) {
        console.log(keys[i])
        await insertDataOneRegimen(keys[i])
    }

    
}

insert()


async function insertDataOneRegimen(regimenId) {
    console.log('---------------------')
    console.log("Inserting data for " + regimenId)
    //make the patient id the same as the regimen id
    let patient = {resourceType:"Patient",id:regimenId,name:[{text:"John Doe - " + regimenId}]}
    addNarrative(patient,"John Doe - " + regimenId)
    let bundle = createBundle(regimenId,patient)

    //console.log(JSON.stringify(bundle,null,2))

    let fileName = "./out/bundle-" + regimenId + ".json"
    let str = JSON.stringify(bundle,null,2)

    fs.writeFileSync(fileName,str)


    //write to the server
    if (updateServer) {
        let url = "http://localhost:9092/baseR4"
        console.log("POSTing to "+url)
        
        return axios.post(url, bundle)
            .then(function (response) {
                console.log(response.status);
                //return
            })

            .catch(function (error) {
                console.log(error.response.data);
               // return
            
            });
    } else {
        console.log("Not updating server")
        return
    }


}




//======== only functions below this point...

// create a bundle with all resources that reference a single regimen

function createBundle(regimenId,patient) {
    let bundle = {resourceType:'Bundle',type:'transaction',entry:[]}
    let ar = [patient]

    //create the regimen CP and associated resources (eg Observations)
    //console.log(hashRegimen[regimenId])
    ar = ar.concat(makeRegimenCP(hashRegimen[regimenId],patient) ) 

    hash = {}
    ar.forEach(function(resource){
        let entry = {resource:resource}
        let fullUrl = "http://canshare.co.nz/fhir/"+ resource.resourceType + "/" + resource.id
        entry.fullUrl = fullUrl

        if (hash[fullUrl]) {
            console.log('duplicate fullUrl:' + fullUrl)
        } else {
            hash[fullUrl] = true
        }

        entry.request = {method:"PUT",url:resource.resourceType + "/" + resource.id}

        bundle.entry.push(entry)
    })

    

    return bundle

}


//create a regimen type careplan from the data in one line of the csv file
//work from the mapping table - https://docs.google.com/spreadsheets/d/1IQTtG_agKUcBAqV_hlaZYhZY0PXRn6kp9qxvNwRWlLk/edit#gid=0
function makeRegimenCP(vo,patient) {

    let ar = vo.data    //the actual data from the csv

    let cp = {resourceType:"CarePlan",id:ar[0],status:'active',intent:'order'}
    addNarrative(cp,"Regimen plan")
    addExtension(cp,extOriginalData,'valueString',JSON.stringify(ar))   //the data used to create this one

    cp.title = ar[4]
    cp.subject = {reference:"Patient/"+patient.id}

    cp.category = [regimenCategory]

    //the intent of the regimen
    let ccIntent = {text:ar[2]}
    addExtension(cp,"http://canshare.co.nz/fhir/StructureDefinition/tx-intent",'valueCodeableConcept',ccIntent)
   
    //start and end date
    cp.period = {}
    cp.period.start = convertDate(ar[5])
    cp.period.end = convertDate(ar[6])
    let arResources = [cp]

    //add the Condition
    let condition = {resourceType:"Condition"}
    condition.id = ar[0]        //todo currently the same as the Regimen careplan

    condition.subject = {reference:"Patient/"+patient.id}
    condition.code = {text:ar[12]}

    arResources.push(condition)

    //the reference from the regimen to the Condition
    cp.addresses = {reference:"Condition/"+ condition.id}


    //add the TNM staging
    //todo exlude null entries - what if only some of the fields are populated?
    arResources = arResources.concat(makeTNMStaging(patient,cp,null,ar[21],ar[22],ar[23],ar[24]))


    //now add the Other Observations


    //now, add all the cycles (and related resources like MedicationAdministrations & Observations)...
    vo.cycles.forEach(function(cycleId){
        let arCpCycleResources = makeCycleCP(hashCycle[cycleId],patient,cp)
        arResources = arResources.concat(arCpCycleResources)
    })


    return arResources
}


//create a CarePlan representing a cycle of treatment
//vo is the entry for this cycle in hashCycle
function makeCycleCP(vo,patient,cpRegimen) {
    let ar = vo.data    //from the line in the cycle csv file
    let meds = vo.meds  //medications associated with this - each entry is an array representng a line from the admin.csv file
    let arResources = []    //the resources created by this function (CarePlan, Medications, Observations)
    //console.log(meds)
    let cp = {resourceType:"CarePlan",id:ar[1],status:'active',intent:'order'}
    addExtension(cp,extOriginalData,'valueString',JSON.stringify(ar))   //the data used to create this one

    addExtension(cp,extCycleNumber,'valueInteger',parseInt(ar[2]))  

    

    cp.subject = {reference:"Patient/"+patient.id}
    cp.partOf = [{reference:"CarePlan/" +cpRegimen.id}]     //a reference to the Regimen CP

    cp.period = {}     
    cp.period.start = convertDate(ar[4])
    cp.period.end = convertDate(ar[5])

    //console.log(cp.period)

    addNarrative(cp,"Cycle plan")
    //cp.title = ar[4]
    cp.category = [cycleCategory]
    arResources.push(cp)

    //now create the MedicationAdministrations and Observations from the administration line
    meds.forEach(function(arLne){
        //lne is a single line from the admin.csv file
        let arAdminResources = makeMedAdmin(arLne,patient,cp)
        arResources = arResources.concat(arAdminResources)
    })

    return arResources

}

function makeMedAdmin(ar,patient,cp) {
    //there is no id for the admin - need to construct one by hashing the entire record

    //let id = ar[2] + ar[5] + ar[6] 

    let tmp = ar.join('-')
    let newId = require('crypto').createHash('md5').update(tmp).digest("hex") 
    //let newId = require('crypto').createHash('md5').update(id).digest("hex") 

    let admin = {resourceType:"MedicationAdministration",id:newId,status:'completed'}
    addExtension(admin,extOriginalData,'valueString',JSON.stringify(ar))   //the data used to create this one

    //addExtension(cp,extBasedOn,'valueReference',{reference:"CarePlan/"+cp.id})   //the data used to create this one

    admin.identifier = [newId]      //temp hack as there is no search param for Supporting info
    admin.supportingInformation = [{reference:"CarePlan/"+cp.id}]

    admin.subject = {reference:"Patient/"+patient.id}
    admin.medicationCodeableConcept = {text:ar[5]}

    admin.dosage = {text:ar[7]}     //administered dose
    admin.dosage.text.trim()

    //if the prescribed dose is different to the administered dose
    if (ar[6]) {
        if (ar[6] !== ar[7]) {
            admin.dosage.text += " (Rx:" + ar[6] + ")"
        }
    }

    admin.dosage.route = {text:ar[8]}

    admin.effectivePeriod = {}     
    admin.effectivePeriod.start = convertDateTime(ar[9])     
    admin.effectivePeriod.end = convertDateTime(ar[10])

    //check for dose adjustment reasons
    for (var i = 13; i <16 ; i++ ) {
        if (ar[i] && (ar[i] !== "NULL")) {
            addExtension(admin,extDoseAdjustReason,'valueString',ar[i])   //dose adjustment reason
        }
    }

    let arResources = [admin]

    //Is there a BSA value
    if (ar[16] !== 'NULL' ) {
        let obs = {resourceType:"Observation",id:newId +"-BSA", status:"final"}
        obs.subject = {reference:"Patient/"+patient.id}
        obs.partOf = [{reference:"MedicationAdministration/"+admin.id}]
        obs.code = {text:"BSA",coding:[{system:"http://loinc.org",code:"8277-6"}]}         //todo confirm code for BSA
        obs.valueQuantity = {unit:"m2",value:ar[16],system:"http://unitsofmeasure.org"}
        obs.effectiveDateTime = admin.effectivePeriod.start      //todo - this is an assumption
        arResources.push(obs)
    }

    //Is there a creatinine clearance value
    if (ar[17] !== 'NULL') {
        let obs = {resourceType:"Observation",id:newId +"-CC",status:"final"}
        obs.subject = {reference:"Patient/"+patient.id}
        obs.partOf = [{reference:"MedicationAdministration/"+admin.id}]
        obs.code = {text:"Creatinine Clearance",coding:[{system:"http://loinc.org",code:"13449-4"}]}         //todo confirm code for BSA
        obs.valueQuantity = {value:ar[17]}              //todo check units
        obs.effectiveDateTime = admin.effectivePeriod.start      //todo - this is an assumption
        arResources.push(obs)
    }

    return arResources
}

//create a set of TNM stare observations compliant with mCode (https://hl7.org/fhir/us/mcode/index.html)
//uses the clincial codes
function makeTNMStaging(patient,regimen,type,t,n,m,stage) {
    //create an id based on regimenId and type of obe (only 1 per regimen ATM)


    let stageObs = makeObservation(regimen.id+'tnm-stage', patient,"21908-9",stage)
    let tObs = makeObservation(regimen.id+'tnm-t',patient,"21905-5",t)
    let nObs = makeObservation(regimen.id+'tnm-n',patient,"21906-3",n)
    let mObs = makeObservation(regimen.id+'tnm-m',patient,"21907-3",m)
    stageObs.hasMember = []
    stageObs.hasMember.push({reference:"Observation/"+tObs.id})
    stageObs.hasMember.push({reference:"Observation/"+nObs.id})
    stageObs.hasMember.push({reference:"Observation/"+mObs.id})
    regimen.supportingInfo = regimen.supportingInfo || []
    regimen.supportingInfo.push({reference:"Observation/"+ stageObs.id})

    return [stageObs,tObs,nObs,mObs]

}

function makeObservation(id,patient,loincCode,value){
    let obs = {resourceType:"Observation",id:id,status:"final"}
    obs.subject = {reference:"Patient/"+patient.id}
    obs.code = {coding:[{system:'http://loinc.org',code:loincCode}]}
    obs.valueCodeableConcept = {coding:[{system:' http://cancerstaging.org',code:value}]}
    return obs
   

}

function addExtension(resource,url,type,value) {
    resource.extension = resource.extension || []
    let ext = {url:url}
    ext[type] = value
    resource.extension.push(ext)
}

//convert from dd/mm/yy to YMD
function convertDate(inDate) {
    //console.log(inDate)
    if (inDate) {
        let ar = inDate.split('/')
        let d = "0"+ar[0]
        let m = "0"+ar[1]
        let y = '20' + ar[2]

        let newDate = y + '-' + m.substr(-2) + '-' + d.substr(-2)
        return newDate

        //let d = new Date(y,ar[1],ar[0])
        //return d.toISOString()
    }
   
}

//11/05/16 11:00
//todo - quite dependant on input - make more robust
function convertDateTime(inDate) {
    //console.log(inDate)
    if (inDate) {
        
        //get the date part
        let ar1 = inDate.split(" ")
        let da = ar1[0]

        let time = ar1[1]
        //time is hrs:mins - but hours are not leading 0
        let ar2 = time.split(':')
        if (ar2[0].length == 1) {ar2[0] = '0' + ar2[0]}
        let newTime = ar2.join(':')


        let ar = da.split('/')
        let d = "0"+ar[0]
        let m = "0"+ar[1]
        let y = '20' + ar[2]

        let newDate = y + '-' + m.substr(-2) + '-' + d.substr(-2)

        newDate += "T"+newTime + ":00Z"
        return newDate

        //let d = new Date(y,ar[1],ar[0])
        //return d.toISOString()
    }
   
}





//add the .text (narrative) element to a resource
function addNarrative(resource,txt) {
    let text = {status:"generated"}
    text.div = "<div xmlns='http://www.w3.org/1999/xhtml'>" + txt + "</div>"
    resource.text = text

}

//========= all the routines to load the data from csv into hashes


function loadAllData(showIssues) {

    //load regimen plans
    let vo = loadCsv("./regimen.csv",0,showIssues)
    hashRegimen = vo.hash
    console.log(Object.keys(hashRegimen).length + " unique regimen entries, " + vo.dups + " duplicated entries")

    //load cycles
    let vo1 =  loadCsv("./cycle.csv",1,showIssues)
    let hashAllCycle = vo1.hash
    console.log(Object.keys(hashAllCycle).length + " unique cycle entries, " + vo1.dups + " duplicated entries")

    //check for cycles with no valid regimen. Also populate the cycle hash with the regimen hash...
    invalidCyleCount = 0

    Object.keys(hashAllCycle).forEach(function(cycleKey){

        let arCycle = hashAllCycle[cycleKey].data       //data from csv

        let regimenId = arCycle[0]          //the location of the regimenid (course_code)
        if (! hashRegimen[regimenId]) {
            invalidCyleCount++
            if (showIssues) {
                console.log("Cycle " + cycleKey + " refers to a non-existant regimen code (" + regimenId + ")")
            }  
        } else {
            //there was a valid regimen entry found
            hashCycle[cycleKey] = {data:arCycle,regimenId:regimenId}    //store the data and the key/id to the parent regimen

            //also add a reference from the regimen to the cycle
            let tmp = hashRegimen[regimenId]
            tmp.cycles = tmp.cycles || []
            tmp.cycles.push(cycleKey)       //the id's of all cycles associated with this regimen
           
        }
    })

    console.log("There were " + Object.keys(hashCycle).length + " cycle entries that had a valid reference to a regimen entry and " +  invalidCyleCount + " where the cycle could not be found")

    //load the administrations. They don't have a unique id, so are in an array...
    let arAllAdministration = loadAdministrations()

    //now check for admins where the link to cycle or admin plans is not correct
    //only those administrations that have a valid link to a cyclw will beprocessed

    let missingCycle = 0
    arAllAdministration.forEach(function(ar){
        let cycleID = ar[2]
        if (hashCycle[cycleID]) {
            arAdministration.push(ar)

            //associate the administration with the cycle...
            let cycle = hashCycle[cycleID]
            cycle.meds = cycle.meds || []
            cycle.meds.push(ar)


        } else {
            missingCycle ++
            if (showIssues) {
                console.log("admin entry has reference to invalid cycle code: "+ cycleID)
            }
        }

    }) 



    console.log('There are ' + arAdministration.length + " valid administrations, " + missingCycle + " where the cycle entry could not be found")


}




function loadAdministrations() {
    let allAdmins = []
    let data = fs.readFileSync("./admin.csv").toString()
    let hash = {}
    let ar = data.split('\r\n')

    ar.forEach(function(lne){
        lne = lne.trim()
        allAdmins.push(lne.split(','))
    })


    return allAdmins

}


function loadCsv(fileName,idPos,showIssues) {

    let data = fs.readFileSync(fileName).toString()
    let hash = {}

    let ar = data.split('\r\n')
    let dups = 0
    ar.forEach(function(lne){
        let ar1 = lne.split(",")
        let id = ar1[idPos]          //the course code - ie 
        if (hash[id]) {
            dups ++
            if (showIssues) {
                console.log(fileName + ": Duplicate code: " + id)
            }
           
        } else {
            hash[id] = {data:ar1}
        }
    })
    return {hash:hash,dups:dups}
    

}
