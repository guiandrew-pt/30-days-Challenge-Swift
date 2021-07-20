// Mission Day 16 - Advanced - Part 2 - RGB - With validation: numbers have to be between 0-255
import UIKit

func rgb(r: Int, g: Int, b: Int) -> String {
    let redNumber: Int? = (r >= 0 && r <= 255) ? r : nil
    let greenNumber: Int? = (g >= 0 && g <= 255) ? g : nil
    let blueNumber: Int? = (b >= 0 && b <= 255) ? b : nil
    var hexString = ""
    
    if redNumber != nil && greenNumber != nil && blueNumber != nil {
        let red = String(format: "%02X", redNumber!)
        let green = String(format: "%02X", greenNumber!)
        let blue = String(format: "%02X", blueNumber!)
        
        hexString = "The hex string for that color will be: #\(red + green + blue)"
    } else {
        hexString = "The code you submit is either wrong or one of the numbers is not between 0 and 255!"
    }

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

r = 153
g = 256
b = 153
hexString = rgb(r: r, g: g, b: b)
print(hexString)
