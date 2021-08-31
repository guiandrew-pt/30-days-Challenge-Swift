// Mission day 27 - Letter "k"
import Foundation

// This project is a MacOS playground project, to work with FileManager
func loadCSV(word: String?) -> String? {
    guard let wordStr = word else {
        return "Word not found"
    }
    
    // Return the first letter of the word
    let firstLetterMostBeK = wordStr.prefix(1).lowercased()

    // If the first letter is different from "k", will return the message
    if !firstLetterMostBeK.contains("k") {
        return "First letter must be k!"
    }
    
    // This is the name of the file
    let fileNameInDeskTop = "K.csv"
    
    var arrStringByRows = [String]()
    
    var printRowWtihK = ""

    // This give the filename without the extension. This is type string.
    let fileName = URL(fileURLWithPath: fileNameInDeskTop).deletingPathExtension().lastPathComponent
    // This give only the extension. This is type string.
    let fileExtension = URL(fileURLWithPath: fileNameInDeskTop).pathExtension
    
    // This will get the file URL(is the path until the file). This is type URL.
    let fileUrl = try! FileManager.default.url(for: .desktopDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    
    // Will give the the path with the filename and extension. This is type URL.
    let pathWithNameFile = fileUrl.appendingPathComponent(fileName).appendingPathExtension(fileExtension)

    do {
        // Will try to get the data in the file.
        let saveData = try String(contentsOf: pathWithNameFile, encoding: .utf8)
        
        // Will split the string with the content of the file, into an array of rows.
        // Each row is a string, and the split is made by the "\n"
        arrStringByRows = saveData.components(separatedBy: "\n")
    } catch {
        return "Error file couldn't be found!"
    }

    // Will remove the first line. Because is a definition of the letter "K", so i think is not count for definitions of words with letter "K".
    arrStringByRows.removeFirst()

    // Loop through array
    for row in arrStringByRows {
        // If the row contains the chosen word, will add to the variable, and break the loop
        if row.contains(wordStr) {
            printRowWtihK = row
            break
        }
    }

    return printRowWtihK
}

let word1 = loadCSV(word: "Kabala")
if let definition = word1 {
    print(definition)
}

let word2 = loadCSV(word: "Kabyle")
if let definition = word2 {
    print(definition)
}

let word3 = loadCSV(word: "Cabala")
if let definition = word3 {
    print(definition)
}
