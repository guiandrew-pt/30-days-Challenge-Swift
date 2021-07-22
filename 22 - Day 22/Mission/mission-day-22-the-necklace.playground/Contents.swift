// Mission Day 22 - The Necklace
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
        
        var result = false
        
        for i in 1...word1.count {
            let firstLetters = String(word1.prefix(i))
            let wordWithoutFirstLetters = String(word1.suffix(word1.count - i))
            let theWord = wordWithoutFirstLetters + firstLetters
            
            if theWord == word2 {
                result = true
                break
            }
        }
        
        return result
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
