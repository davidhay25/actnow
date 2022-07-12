#!/usr/bin/env node
/**
 * Create a transaction bundle from the the collection bundle created by sushi
 * specifically for the scenario examples with multiple bundles
 * show changes over time
 * */

const fs = require('fs');



makeTransactionBundle("../fsh-generated/resources/Bundle-scen1-bundle-1")


function makeTransactionBundle(fileName) {
    let inFileName = fileName + ".json"
    let outFileName = fileName + "-tran.json"

    let contents = fs.readFileSync(inFileName, {encoding: 'utf8'});

    //convert into a transaction bundle
    let bundle = JSON.parse(contents)
    bundle.type = "transaction"

    //first, we need to convert all id's & references to a uuid
    let hashUuid = {}
    bundle.entry.forEach(function(entry){
        let resource = entry.resource
        hashUuid[resource.id] = {uuid:createUUID(),type:resource.resourceType}
    })

    let server = "http://clinfhir.com/fhir/"

    //now we can update the bundle - changing the id's to the uuid & setting the full url
    //also need to update any references...

    bundle.entry.forEach(function(entry){

        let resource = entry.resource
        let match = hashUuid[resource.id] 
        let uuid = match.uuid   //this is the new id to use
        resource.id = uuid
       

        //now to update the references. Use a brute force approach with string replace
        //in theory could replace the wrong thing
        let newStr = ""
        let str = JSON.stringify(resource)
        Object.keys(hashUuid).forEach(function(oldId){
            let match = hashUuid[oldId]
            let newId = "urn:uuid:" +  match.uuid
            let oldReference = match.type + "/" + oldId
            // just do a string replace

            console.log(oldReference,newId)

            str = str.split(oldReference).join(newId) 

        })

        entry.resource = JSON.parse(str)

        entry.fullUrl =  "urn:uuid:" + resource.id
      
        let url = resource.resourceType + "/" + resource.id

        let method = "POST"
        switch (resource.resourceType) {
            case "CarePlan" :
            case "Patient" :
                //conditional update
                if (resource.identifier) {
                    method = "PUT"
                    url += "?identifier=" + resource.identifier[0].system + "|" + resource.identifier[0].value
                }
                break
            
        }

        
    
        entry.request = {method:method,url: url}

        //make all resources conditional updates - 

        
    })

    fs.writeFileSync(outFileName,JSON.stringify(bundle))
}


function createUUID() {
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
        var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
        return v.toString(16);
    });
}