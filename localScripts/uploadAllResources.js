#!/usr/bin/env node

/**
 * Upload all the resources created by the IG to the act-now server so they can be used in validation and development
 * 
 */

const fs = require('fs');
const axios = require ('axios')

let fullFolderPath = "../fsh-generated/resources/";
let conformanceServer = "http://actnow.canshare.co.nz:9092/baseR4/"
//let conformanceServer = "https://r4.ontoserver.csiro.au/fhir/"


let bundle = {resourceType:"Bundle",type:'transaction',entry:[]}

let arFiles = fs.readdirSync(fullFolderPath);
arFiles.forEach(function(name){
  
        let fullFileName = fullFolderPath + name;

       // console.log(fullFileName)
        let contents = fs.readFileSync(fullFileName).toString();
        let resource = JSON.parse(contents)

        let entry = {resource:resource}
        entry.request = {method:'PUT',url:resource.resourceType + "/" + resource.id}
        bundle.entry.push(entry)
        //resource.fhirVersion = "4.0.0"
        console.log(resource.resourceType + " " + resource.id)
       // upploadResource(resource)
    
})
fs.writeFileSync("./bundleUpload.json",JSON.stringify(bundle))
console.log("Uploading generated resources, please wait...")
let url = conformanceServer
axios.post(url,bundle).then(function(response){
    console.log(response.status)
    console.log(JSON.stringify(response.data))
}).catch(function(err){
    console.log(err.response.data)
})



