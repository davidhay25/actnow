#!/usr/bin/env node

const fs = require('fs');
const axios = require ('axios')

let fullFolderPath = "../fsh-generated/resources/";
//let conformanceServer = "http://home.clinfhir.com:8054/baseR4/"
let conformanceServer = "http://actnow.canshare.co.nz:9092/baseR4/"

async function upploadResource(resource) {
    let url = conformanceServer + resource.resourceType + "/" + resource.id
    try {
        results = await axios.put(url,resource)
        console.log('uploaded ' + resource.id)
        return results
    } catch (ex) {
        console.log(ex)
    }
   
}

let arFiles = fs.readdirSync(fullFolderPath);
arFiles.forEach(function(name){
    if (name.indexOf("StructureDefinition-") > -1 ) {
        let fullFileName = fullFolderPath + name;

       // console.log(fullFileName)
        let contents = fs.readFileSync(fullFileName).toString();
        let resource = JSON.parse(contents)
        //resource.fhirVersion = "4.0.0"
        console.log(resource.id)
        upploadResource(resource)
    }
})




