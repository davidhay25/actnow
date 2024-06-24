#!/usr/bin/env node

/**
 * Upload all the resources created by the IG to the act-now server so they can be used in validation and development
 * 
 * //need to manually upload the sact_regimen type & associated valueset
 * 
 */

const fs = require('fs');
const axios = require ('axios')

let fullFolderPath = "../fsh-generated/resources/";
//let conformanceServer = "http://actnow.canshare.co.nz:9092/baseR4/"
//let conformanceServer = "https://r4.ontoserver.csiro.au/fhir/"
//let conformanceServer = "http://hapi.fhir.org/baseR4/"
//let conformanceServer = "https://hof.smilecdr.com/fhir_request/"

//let conformanceServer = "http://localhost:8080/fhir/" //the server in docker
//let conformanceServer = "http://poc.canshare.co.nz:8080/fhir/" //the server in poc
//let conformanceServer = "http://localhost:8087/fhir/" //the server in poc

let conformanceServer = "http://test.canshare.co.nz:8080/fhir/"


let bundle = {resourceType:"Bundle",type:'transaction',entry:[]}

let arFiles = fs.readdirSync(fullFolderPath);
arFiles.forEach(function(name){
  
        let fullFileName = fullFolderPath + name;

       // console.log(fullFileName)
        let contents = fs.readFileSync(fullFileName).toString();
        let resource = JSON.parse(contents)

        if (resource.resourceType !== 'ImplementationGuide' && resource.resourceType !== 'ValueSetDEP') {
            let entry = {resource:resource}
            entry.request = {method:'PUT',url:resource.resourceType + "/" + resource.id}
            bundle.entry.push(entry)
            //resource.fhirVersion = "4.0.0"
            console.log(resource.resourceType + " " + resource.id)
        }
       


       // upploadResource(resource)
    
})
fs.writeFileSync("./bundleUpload.json",JSON.stringify(bundle))
console.log("Uploading generated resources, please wait...")
let url = conformanceServer
axios.post(url,bundle).then(function(response){
    console.log(response.status)
    //console.log(response.data)
    console.log(JSON.stringify(response.data,null,2))
}).catch(function(err){
    console.log(err)
    console.log(err.response.data)
})



