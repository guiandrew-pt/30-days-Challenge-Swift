// Mission Day 16 - Advanced - Part 1 - RGB
import UIKit

func rgb(r: Int, g: Int, b: Int) -> String {
    let red = String(format: "%02X", r)
    let green = String(format: "%02X", g)
    let blue = String(format: "%02X", b)
    
    let hexString = "The hex string for that color will be: #\(red + green + blue)"
    
    return hexString
}

var r = 255
var g = 99
var b = 71
var hexString = rgb(r: r, g: g, b: b)
print(hexString)

r = 255
g = 0
b = 0
hexString = rgb(r: r, g: g, b: b)
print(hexString)

r = 153
g = 255
b = 153
hexString = rgb(r: r, g: g, b: b)
print(hexString)
