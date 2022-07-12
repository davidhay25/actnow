#!/usr/bin/env node
/**
 * Create a transaction bundle from the the collection bundle created by sushi
 * */

const fs = require('fs');


let fullFileName = "./fsh-generated/resources/Bundle-an-completeBundle.json";
let transactionFileName = "./fsh-generated/resources/Bundle-an-completeBundle-tran.json";

let contents = fs.readFileSync(fullFileName, {encoding: 'utf8'});

//convert into a transaction bundle
let bundle = JSON.parse(contents)
bundle.type = "transaction"

let server = "http://clinfhir.com/fhir/"

bundle.entry.forEach(function(entry){

    let resource = entry.resource
    entry.fullUrl = server + resource.resourceType + "/" + resource.id

    entry.request = {method:"PUT",url:resource.resourceType + "/" + resource.id}
    
})

fs.writeFileSync(transactionFileName,JSON.stringify(bundle))