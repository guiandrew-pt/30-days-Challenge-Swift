// Mission day 15 - Advanced - Anagram
func anagram(strOne: String, strTwo: String) -> Bool {
    if strOne.count == 0 || strTwo.count == 0 {
        return false
    }
    
    // This will convert all letters to lowercase first, and next will put all letters in alphabet order.
    let stringOne = String(strOne.lowercased().sorted())
    let stringTwo = String(strTwo.lowercased().sorted())
    
    if stringOne == stringTwo {
        return true
    }
    
    return false
}

let isAnagram = anagram(strOne: "Listen", strTwo: "Silent")
print("Is the second string an anagram od the first string: \(isAnagram)")
