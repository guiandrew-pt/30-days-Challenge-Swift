// Mission Day 27 - Advanced - Perfect HashTable
import Foundation

public struct HashTable<Key: Hashable, Value> {
    typealias Element = (key: Key, value: Value)
    typealias Bucket = [Element]
    var buckets: [Bucket]

    // This will be the amount of key-value pairs in the hash tabble
    var count = 0

    // This will indicate if the hash table is empty.
    var isEmpty: Bool {
        return count == 0
    }

    // Will initiate(create) the hash table and will give the capacity of her
    init(capacity: Int) {
        assert(capacity > 0)
        buckets = Array<Bucket>(repeatElement([], count: capacity))
    }

    // Will give the element value of the given key
    func getValue(forKey key: Key) -> Value? {
        let index = index(forKey: key)
        for element in buckets[index] {
            if element.key == key {
                return element.value
            }
        }
        return nil
    }

    // Will update the value of the element in the hash table, of the given key.
    // If don't exist value for the given key, will create a key-value pair.
    mutating func updateValue(_ value: Value, forKey key: Key) -> Value? {
        let index = index(forKey: key)

        for (indexLoop, element) in buckets[index].enumerated() {
            if element.key == key {
                let changeThisValue = element.value
                buckets[index][indexLoop].value = value
                return changeThisValue
            }
        }

        // If not exist
        buckets[index].append((key: key, value: value))
        count += 1
        return nil
    }

    // Will remove all
    mutating func removeAll() {
        buckets = Array<Bucket>(repeatElement([], count: buckets.count))
        count = 0
    }

    // Wii give the index of the given key
    private func index(forKey key: Key) -> Int {
        return abs(key.hashValue % buckets.count)
    }
}

func giveThePath() -> Data {
    // This is the file path
    let path = Bundle.main.paths(forResourcesOfType: "csv", inDirectory: nil).first!
    
    let fileManger = FileManager.default
    
    // will be the content in the file. Will Data.
    let data = fileManger.contents(atPath: path)!
    
    return data
}

func removeQuotesAndSplit(file: String) -> [Substring] {
    let nonQuoteString = file.replacingOccurrences(of: "\"", with: "")
    let rows = nonQuoteString.split(separator: "\r\n")
    return rows
}

func removeEmptyLeadingSpace(_ text: String) -> String {
    return String(text.suffix(text.count - 1))
}

func firstLetterFromWord(word: String) -> Bool {
    // Return the first letter of the word
    let firstLetterMostBeK = word.prefix(1).lowercased()

    // If the first letter is different from "k", will return the message
    if firstLetterMostBeK.contains("k") {
        return true
    }
    
    return false
}

func loadCSV(word: String?) -> String? {
    guard let wordStr = word else {
        return "Word not found"
    }
    
    // Return the first letter of the word
    let firstLetterMostBeK = firstLetterFromWord(word: wordStr)

    // If the first letter is different from "k", will return the message
    if !firstLetterMostBeK {
        return "First letter must be k!"
    }
    
    let data = giveThePath()
    // print(data)
    
    // Convert the the content from data to string
    let contentOnDataConvertedToString = String(decoding: data, as: UTF8.self)
    
    // Will create  Hash Table.
    var hash = HashTable<String, String>(capacity: 1)

    let rows = removeQuotesAndSplit(file: contentOnDataConvertedToString)
    //print(rows)
        
    // will loop through the rows
    for row in rows {
        if let indexKey = row.firstIndex(of: " "), let definitionValue = row.firstIndex(of: ")") {

            let key = String(row[..<indexKey])
            var definition = String(row[row.index(after: definitionValue)...])
            definition = removeEmptyLeadingSpace(definition)
            
            // Will add the value and the key in the hash table
            hash.updateValue(definition, forKey: key)
        }
    }
    
    // Will get the value, with the given key
    if let printDefinition = hash.getValue(forKey: wordStr) {
        return printDefinition
    } else {
        return "Don't exist value for the given key!ß"
    }
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
