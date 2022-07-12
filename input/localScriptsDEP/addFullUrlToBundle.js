#!/usr/bin/env node
/**
 * Add the fullUrl element to all entries in a bundle
 * - to avoid having to do it manually...
 * */

const fs = require('fs');


let fullFileName = "./fsh-generated/resources/Bundle-an-completeBundle.json";

let contents = fs.readFileSync(fullFileName, {encoding: 'utf8'});

//convert into a transaction bundle
let bundle = JSON.parse(contents)

let server = "http://clinfhir.com/fhir/"

bundle.entry.forEach(function(entry){
    let resource = entry.resource
    entry.fullUrl = server + resource.resourceType + "/" + resource.id
    
})

fs.writeFileSync(fullFileName,JSON.stringify(bundle))