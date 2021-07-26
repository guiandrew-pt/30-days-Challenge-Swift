// Mission Day 22 - The Necklace - version 2
func necklace(_ str1: String?, _ str2: String?) -> Bool? {
    if let word1 = str1, let word2 = str2 {
        // If the lenght of both words are different, then is false
        if word1.count != word2.count {
            return false
        }
        
        // if both are empty so they are true
        if word1.isEmpty && word2.isEmpty {
            return true
        }
        
        var resultOfTheWord1 = false
        var resultOfTheWord2 = false
        
        // Will verify the first word, to check is will "necklace", and become equal to the second word
        for i in 1...word1.count {
            let firstLettersFromWord1 = String(word1.prefix(i))
            let word1WithoutFirstLetters = String(word1.suffix(word1.count - i))
            let theWord = word1WithoutFirstLetters + firstLettersFromWord1
            
            if theWord == word2 {
                resultOfTheWord1 = true
                break
            }
        }
        
        // Will verify the second word, to check is will "necklace", and become equal to the first word
        for i in 1...word2.count {
            let firstLettersFromWord2 = String(word2.prefix(i))
            let word2WithoutFirstLetters = String(word2.suffix(word2.count - i))
            let theWord = word2WithoutFirstLetters + firstLettersFromWord2
            
            if theWord == word1 {
                resultOfTheWord2 = true
                break
            }
        }
        
        if resultOfTheWord1 && resultOfTheWord2 {
            return true
        } else {
            return false
        }
    }
    
    return nil
}

///
if let isTrue = necklace("nicole", "icolen") { // true
    print(isTrue)
}
if let isTrue = necklace("nicole", "lenico") { // true
    print(isTrue)
}
if let isTrue = necklace("nicole", "coneli") { // false
    print(isTrue)
}
if let isTrue = necklace("aabaaaaabaab", "aabaabaabaaa") { // true
    print(isTrue)
}
if let isTrue = necklace("abc", "cba") { // false
    print(isTrue)
}
if let isTrue = necklace("xxyyy", "xxxyy") { // false
    print(isTrue)
}
if let isTrue = necklace("xyxxz", "xxyxz") { // false
    print(isTrue)
}
if let isTrue = necklace("x", "x") { // true
    print(isTrue)
}
if let isTrue = necklace("x", "xx") { // false
    print(isTrue)
}
if let isTrue = necklace("x", "") { // false
    print(isTrue)
}
if let isTrue = necklace("", "") { // true
    print(isTrue)
}
