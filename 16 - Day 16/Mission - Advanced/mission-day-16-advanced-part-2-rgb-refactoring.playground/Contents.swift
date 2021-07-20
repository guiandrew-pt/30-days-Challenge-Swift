// Mission Day 16 - Advanced - Part 2 - RGB - With validation: numbers have to be between 0-255
import UIKit

func validadeRGBNumber(_ code: Int) -> Bool {
    if code >= 0 && code <= 255 {
        return true
    }
    
    return false
}

func formatToHexadecimal(_ code: Int) -> String {
    let formatCode = String(format: "%02X", code)
    return formatCode
}

func message(r: String?, g: String?, b: String?) -> String {
    if r != nil && g != nil && b != nil {
        return "The hex string for that color will be: #\(r! + g! + b!)"
    }
    
    return "The code you submit is either wrong or one of the numbers is not between 0 and 255!"
}

func rgb(r: Int, g: Int, b: Int) -> String {
    let redNumber: Int? = validadeRGBNumber(r) ? r : nil
    let greenNumber: Int? = validadeRGBNumber(g) ? g : nil
    let blueNumber: Int? = validadeRGBNumber(b) ? b : nil
    var hexString = ""
    
    if redNumber != nil && greenNumber != nil && blueNumber != nil {
        let red = formatToHexadecimal(redNumber!)
        let green = formatToHexadecimal(greenNumber!)
        let blue = formatToHexadecimal(blueNumber!)
        
        hexString = message(r: red, g: green, b: blue)
    } else {
        hexString = message(r: nil, g: nil, b: nil)
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
