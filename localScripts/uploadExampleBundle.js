#!/usr/bin/env node
/**
 * Upload act-now example bundles
  a single file at a time (for simplicity) - might make multiple later
 * */

const http = require('http')
const fs = require('fs');

let serverUrl = "canshare.clinfhir.com"
//let serverUrl = "localhost"

let fullFileName = "./fsh-generated/resources/Bundle-an-completeBundle.json";

let contents = fs.readFileSync(fullFileName, {encoding: 'utf8'});

//convert into a transaction bundle
let bundle = JSON.parse(contents)
bundle.type = "transaction"
bundle.type = "batch"
bundle.entry.forEach(function(entry){
  let resource = entry.resource
  entry.request = {method:"PUT",url:resource.resourceType + "/" + resource.id}
  
})

let json = JSON.stringify(bundle)

//console.log(json)

const options = {
    hostname: serverUrl, // 'canshare.clinfhir.com',
    port: 9099,
    path: '/baseR4/',
    method: 'POST',
    headers: {
      'Content-Type': 'application/fhir+json',
      'Content-Length': json.length
    }
  }
  
  const req = http.request(options, res => {
    console.log(`statusCode: ${res.statusCode}`)
  
    res.on('data', d => {
     // process.stdout.write(d)
    })
  })
  
  req.on('error', error => {
    console.error('error',error)
  })
  console.log("writing...")
  req.write(json)
  req.end()

  
  //----------


