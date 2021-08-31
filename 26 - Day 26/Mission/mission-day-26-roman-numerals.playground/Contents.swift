// Mission Day 26 - Roman Numerals
func romanNumerals(number: Int?) -> String? {
    guard var num = number else {
        return nil
    }
    
    let numbers = [ 1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1 ]
    
    let romanNumerals = [ "M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I" ]
    
    var romanNumeral = ""
    
    for i in 0..<numbers.count {
        while numbers[i] <= num {
            //print(numbers[i])
            romanNumeral += romanNumerals[i]
            num -= numbers[i]
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
