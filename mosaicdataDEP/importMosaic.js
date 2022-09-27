#!/usr/bin/env node
/**
 *import cycle data from mosaic...
 * */

const fs = require('fs');


//load cycle data
let hashCycle = {}      //hash keyed on cycle code
let cycleFileName = "./cycle.csv";

let cycleContents = fs.readFileSync(cycleFileName, {encoding: 'utf8'});

let lines = cycleContents.split(/\r?\n/)
lines.forEach(function(lne) {
    let ar = lne.split(',')
    let cycleCode = ar[1]
    if (hashCycle[cycleCode]) {
        console.log("duplicated code: " + cycleCode)
    } else {
        hashCycle[cycleCode] = ar
    }
})

console.log(lines.length)