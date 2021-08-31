// Mission Day 26 - Roman Numerals - With a dictionary
func romanNumerals(number: Int?) -> String? {
    guard var num = number else {
        return nil
    }
    
    var romanNumeral = ""
    
    // Dictionary
    let dictionaryDenaryRoman = [ 1000: "M", 900: "CM", 500: "D", 400: "CD", 100: "C", 90: "XC", 50: "L", 40: "XL", 10: "X", 9: "IX", 5: "V", 4: "IV", 1: "I" ]

    /// Will loop through the dictionary, sorted from biggest to smallest
//    for item in Array(dictionaryDenaryRoman).sorted(by: { $0.key > $1.key }) {
//        while num >= item.key {
//            romanNumeral += item.value
//            num -= item.key
//        }
//    }
    // OR
    for (key, value) in Array(dictionaryDenaryRoman).sorted(by: > ) {
        while num >= key {
            romanNumeral += value
            num -= key
        }
    }
    
    return romanNumeral
}

if let value = romanNumerals(number: 2) {
    print(value) // II
}

if let value = romanNumerals(number: 3) {
    print(value) // III
}

if let value = romanNumerals(number: 44) {
    print(value) // XLIV
}

if let value = romanNumerals(number: 649) {
    print(value) // DCXLIX
}

if let value = romanNumerals(number: 2014) {
    print(value) // MMXIV
}

if let value = romanNumerals(number: 3999) {
    print(value) // MMMCMXCIX
}
