#!/usr/bin/env node
/**
 * the example bundle

 * */

const http = require('http')
const fs = require('fs');

let fullFileName = "../fsh-generated/resources/Bundle-lungCancer1.json";
let contents = fs.readFileSync(fullFileName, {encoding: 'utf8'});




const options = {
    hostname: 'home.clinfhir.com',
    port: 8054,
    path: '/baseR4/Bundle/lungCancer1',
    method: 'PUT',
    headers: {
      'Content-Type': 'application/fhir+json',
      'Content-Length': contents.length
    }
  }
  
  const req = http.request(options, res => {
    console.log(`statusCode: ${res.statusCode}`)
  
    res.on('data', d => {
     // process.stdout.write(d)
    })
  })
  
  req.on('error', error => {
    console.error(error)
  })
  
  req.write(contents)
  req.end()

  
  //----------


