// Mission day 16 - Part 2 - Junk
import UIKit

func junk(_ str: String) -> String {
    // Regex pattern. NOTE: To include the square brackets with two backslash. Example: \\[
    let pattern = "[{}\\[\\]!<>()]+"
    
    // this will be the pattern, the pattern of characters to remove
    let regex = try! NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive)
    
    // This will be the range
    let range = NSMakeRange(0, str.count)
    
    // Here will replace the pattern (in this case the symbols in the string pattern) with a space)
    let newString = regex.stringByReplacingMatches(in: str, options: [], range: range, withTemplate: " ")
    
    return newString
}

let theString = "Hello,{swift}[this]!<is>(something)"
let printThis = junk(theString)
print(printThis)
