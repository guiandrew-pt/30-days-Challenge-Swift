// Mission Day 20 - Advanced - Hex Converter
import UIKit

func hexConverter(_ str: String?) -> String? {
    if let string = str {
        
        // First we have to encoding to utf-8
        let data = Data(string.utf8)
        
        // Will loop for each character, formating to hexadecimal.
        // Then will convert the array string to a string, joining the elements.
        let result = data.map {
            String(format: "%02X", $0)
        }.joined()

        return result
    }
    
    return nil
}


///
let hex1 = hexConverter("IOS")
if let hexadecimal = hex1 {
    print(hexadecimal)
}

let hex2 = hexConverter("14")
if let hexadecimal = hex2 {
    print(hexadecimal)
}
