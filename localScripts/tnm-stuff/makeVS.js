#!/usr/bin/env node
/**
Make ValueSets from csv
 * */

const fs = require('fs');

let fileName = "./cT.csv"

let contents = fs.readFileSync(fileName, {encoding: 'utf8'});

let lines = contents.split(/\r?\n/)

console.log(lines.length)

let hashDxDescription = {}     //description of the dx codes

let lastDx
let hashDx = {}     //keyed by dx
lines.forEach(function(line){
    let ar = line.split(',')
    let dx = ar[0] //actually the chapter
    if (dx) {
        let desc = ar[1] //description of the diagnosis
        hashDxDescription[dx] = desc
        let option = ar[3] //the 'cT' option
        let snomed = ar[5] //the snomed code
    
        if (dx == lastDx){
            //this line is the same dx as the previous
            hashDx[dx].options.push(snomed)
        } else {
            //this is a new dx
            hashDx[dx] = {desc:desc,dx:dx,options:[snomed]}
            lastDx = dx
        }
    }
    
}) 

console.log(hashDxDescription)
console.log(Object.keys(hashDx).length)

//now figure out how many unique combinations of options there are
let hashSig = {}
Object.keys(hashDx).forEach(function(key,inx){
    let options = hashDx[key].options

    let sig = options.join("-")
    if (hashSig[sig]) {
        hashSig[sig].push(hashDx[key])
    } else {
        hashSig[sig] = [hashDx[key]]
    }
  
    //console.log(key,options,sig)


})

Object.keys(hashSig).forEach(function(key,inx){
    if (inx == 3) {
        let vs = createVS(hashSig[key])
        console.log(vs)
        fs.writeFileSync("./vs.json",JSON.stringify(vs))
    }
    
})

   


console.log('hashsig',Object.keys(hashSig).length)

//item {dx, options:[]}
function createVS(items) {
    console.log(items)
    let vs = {resourceType:'ValueSet',status:'draft',useContext:[],compose:{include:[]}}
    
    //create the useContext
    items.forEach(function(item){
        let ctx = {}
        ctx.code = {code:'focus',system:'http://terminology.hl7.org/CodeSystem/usage-context-type'}
        ctx.valueCodeableConcept = {coding:[{code:item.dx,display:hashDxDescription[item.dx]}]}

        vs.useContext.push(ctx)
    })


    //create the actual codes. 
    let inc = {system:'http://canshare.co.nz',concept:[]}
    items[0].options.forEach(function(dx){
        vs.url = "http://canshare.co.nz/ValueSet/tnm-ct"+dx
        inc.concept.push({code:dx})
    })

    vs.compose.include.push(inc)


    return vs

}