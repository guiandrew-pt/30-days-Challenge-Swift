import UIKit

// Part 1
var firstStr = "cody"
var secondStr = "Code in Swift!"
var isContain: Bool = false

for letter in firstStr {
    if secondStr.contains(letter) {
        isContain = true
        break
    }
}

print(isContain)


// Part 2
var thirdStr = "cody"
var fourthStr = "Code in Swift!"
var isTrue: Bool = false

for letterFirst in thirdStr {
    for letterSecond in fourthStr {
        if letterFirst == letterSecond {
            isTrue = true
            break
        }
    }
}

print(isTrue)


// Another way
//let f = "Help"
//let s = "Hello, world!"
//let elementsEqualFunc = s.elementsEqual(f)
//let elementsEqualFunc1 = secondStr.elementsEqual(firstStr)
////print(elementsEqualFunc)
//print(elementsEqualFunc1)

var firstN = "Help"
var las = "Hello, world!"

if firstN.elementsEqual(las) {
    print(las)
} else {
    print("None")
}

let portion = firstN.contains(las)
print(portion)

