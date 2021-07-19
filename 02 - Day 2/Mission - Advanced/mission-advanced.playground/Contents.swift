import UIKit

/// Advanced: Reverse String
let strToReverse = "This is a very nice string to do the reverse."
print(strToReverse)

/// Part 1 - Reverse a String in Swift using built-in functions.
let strReversed = String(strToReverse.reversed())
print(strReversed)

/// Part 2 - Reverse a String in Swift without using built-in functions.
var strReversed2 = ""
for char in strToReverse {
    strReversed2 = "\(char)" + strReversed2
}
print(strReversed2)







