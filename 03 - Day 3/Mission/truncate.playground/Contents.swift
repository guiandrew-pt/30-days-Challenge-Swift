import UIKit

// Day 3 Mission-> part 1 - Truncate
// welcome
let welcome = "Welcome"
let welcomeTruncate = welcome.prefix(4)
print(welcomeTruncate)

// Hello, World!
var helloWorld = "Hello, World!"
let indexBlankSpaceOfWorldAfter = helloWorld.firstIndex(of: " ")
let indexOfWorld = helloWorld.index(after: indexBlankSpaceOfWorldAfter!)
let i = helloWorld[indexOfWorld...]
let range = helloWorld.range(of: i)!
helloWorld.removeSubrange(range)

print(helloWorld)

//helloWorld.append("Swift!")
//print(helloWorld)

// Disaster
let disaster = "Disaster"
let disasterTruncate = disaster.prefix(1)
print(disasterTruncate)
