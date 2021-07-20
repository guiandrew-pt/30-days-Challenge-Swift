import UIKit

// Circles
let pi = 3.14

func areaCircle(radius: Int) -> Double {
    return pi * pow(Double(radius), 2)
}

// For the given values: r15; r7; r128; r6
print(areaCircle(radius: 15))
print(areaCircle(radius: 7))
print(areaCircle(radius: 128))
print(areaCircle(radius: 6))
