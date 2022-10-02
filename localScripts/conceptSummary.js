#!/usr/bin/env node

// consruct a summary page of all concepts in IG
// 'ObservableEntities' come from Observations (for now)
// codesystem definitions are main section - sort by system
//  - also have downloadable CSV

let fs = require('fs');
let resourcesFolder = "../fsh-generated/resources/"
let hashConcepts = {}       //has of all concepts from CodeSystem  {cs url, system, code}

// load all resources


fs.readdirSync(resourcesFolder).forEach(function(file) {
    //console.log(file)
    let fullPath = resourcesFolder + file
    let ar = file.split('-')
    switch (ar[0]) {
        case 'CodeSystem' :
            //this is a custom codesystem - will need to have snomed codes at some point
            //retrieve the concepts of the code system
            let cs = loadFile(fullPath)
            if (cs.concept) {
                cs.concept.forEach(function(concept){
                    hashConcepts[cs.url] = hashConcepts[cs.url] || []
                    let item = {url:cs.url,code:concept.code}
                    hashConcepts[cs.url].push(item)
                })
            }

            console.log(cs.url)
            break;
    }
})

console.log(JSON.stringify(hashConcepts,null,2))



function loadFile(fullFileName) {
    //let fullFileName = rootPath + path;
    let contents = fs.readFileSync(fullFileName, {encoding: 'utf8'});
    let resource = JSON.parse(contents)
    return resource;
}