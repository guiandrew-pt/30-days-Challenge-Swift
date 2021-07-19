import UIKit

// Day 3 Mission-> part 2 - Character Builder
// Variables
let person = "Mark"
let car = "Jep"
let animal = "Leopard"
let city = "Townsville"
let game = "Cards"
let water = "Flows"
let clean = "Shower"
let mood = "Frown"

let mIndex = person.firstIndex(of: "M")
let letterM = person[mIndex!]

let eIndex = car.firstIndex(of: "e")
let letterE = car[eIndex!]

let lIndex = animal.firstIndex(of: "L")
let letterL = animal[lIndex!].lowercased()

let tIndex = city.firstIndex(of: "T")
let letterT = city[tIndex!].lowercased()

let dIndex = game.firstIndex(of: "d")
let letterD = game[dIndex!]

let oIndex = water.firstIndex(of: "o")
let letterO = water[oIndex!]

let wIndex = clean.firstIndex(of: "w")
let letterW = clean[wIndex!]

let nIndex = mood.firstIndex(of: "n")
let letterN = mood[nIndex!]

let meltdown = String(letterM) + String(letterE) + String(letterL) + String(letterT) + String(letterD) + String(letterO) + String(letterW) + String(letterN)
print(meltdown)
