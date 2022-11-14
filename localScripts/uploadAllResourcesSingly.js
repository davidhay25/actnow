#!/usr/bin/env node

/**
 * Upload all the resources created by the IG to the act-now server so they can be used in validation and development
 * THis version uploads each one singly, codesystems then ValueSets then SD/
 */

const fs = require('fs');
const axios = require ('axios')

const syncRequest = require("../../globalScripts/node_modules/sync-request")

let fullFolderPath = "../fsh-generated/resources/";
//let conformanceServer = "http://actnow.canshare.co.nz:9092/baseR4/"
//let conformanceServer = "https://r4.ontoserver.csiro.au/fhir/"
let conformanceServer = "http://hapi.fhir.org/baseR4/"


function uploadSingleType(type) {
    console.log("Uploading " + type)
    let arFiles = fs.readdirSync(fullFolderPath);
    //let response = await axios.put(url,resource)
    let inx = 0
   // let 

    arFiles.forEach(function(name){

        let fullFileName = fullFolderPath + name;

        // console.log(fullFileName)
        let contents = fs.readFileSync(fullFileName).toString();
        let resource = JSON.parse(contents)
        if (resource.resourceType == type) {
            console.log("file: " + resource.id)
            let url = conformanceServer + resource.resourceType + "/" + resource.id
            let response = syncRequest("put",url,{json:resource})
            console.log(response.statusCode,response.body.toString())
        }
    })
    
}


uploadSingleType('CodeSystem')
uploadSingleType('ValueSet')
uploadSingleType('StructureDefinition')



async function uploadOneFile(resource) {
    console.log("file: " + resource.id)
    let url = conformanceServer + resource.resourceType + "/" + resource.id
    return axios.put(url,resource)
/*
    for (i =0 ; i < 10; i++) {
        try {
            let response = await axios.put(url,resource)
            console.log('done')
        } catch (ex) {
            console.log(ex.response.data)
        }
    }
*/
    
    
}




