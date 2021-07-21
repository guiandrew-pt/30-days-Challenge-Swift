// Mission Day 20 - Pig Latin
import UIKit

func pigLatin(_ englishWord: String?) -> String? {
    if let word = englishWord {
        var result = ""
        var countConsonants = 0
        
        // This loop, fist check is the char is a vowel, is is a vowel, will break and stop the loop,
        // if not continue counting
        for char in word {
            if checkIfHaveRangeWithVowels(String(char).lowercased()) {
                break
            } else {
                countConsonants += 1
            }
        }
        
        if countConsonants == 0 {
            result = newWord(word, nil, ConsonantOrVowel.Vowel) ?? ""
        } else {
            // Drop will be the word without the consonant or the group of consonants
            let drop = word.dropFirst(countConsonants)
            // Prefix will be the consonants or the group of consonants
            let prefix = word.prefix(countConsonants)
            
            result = newWord(String(drop), String(prefix), ConsonantOrVowel.Consonant) ?? ""
        }
        
        return result
    }
    
    return nil
}

func checkIfHaveRangeWithConsonants(_ str: String) -> Bool {
    // This will be the pattern to check if have consonants
    let patternToCheckConsonants = "[a-z&&[^aeiou]]+"
    
    // return true if have a range with that pattern, if not return false
    return str.range(of: patternToCheckConsonants, options: .regularExpression) != nil
}

func checkIfHaveRangeWithVowels(_ str: String) -> Bool {
    // This will be the pattern to check if have vowels
    let patternToCheckVowels = "[aeiou]+"
    
    // return true if have a range with that pattern, if not return false
    return str.range(of: patternToCheckVowels, options: .regularExpression) != nil
}

func newWord(_ word: String?, _ prefix: String?, _ consonantOrVowel: ConsonantOrVowel) -> String? {
    if let newWord = word {
        let patternToAddWhenConsonants = "ay"
        let patternToAddWhenVowels = "way"
        var result = ""
        
        // If is Vowel, will built the new word and only add "way" at the end. If not,
        // if have a consonant or a group of consonants, will move it to the end of the word, and add ay to it.
        if consonantOrVowel == ConsonantOrVowel.Vowel {
            result = newWord + patternToAddWhenVowels
        } else {
            if let pre = prefix {
                result = newWord + pre.lowercased() + patternToAddWhenConsonants
            }
        }
        
        return result
    }
    
    return nil
}

enum ConsonantOrVowel {
    case Consonant
    case Vowel
}

///
let newWord1 = pigLatin("Fire")
if let word = newWord1 {
    print(word)
}

let newWord2 = pigLatin("California")
if let word = newWord2 {
    print(word)
}

let newWord3 = pigLatin("Alaska")
if let word = newWord3 {
    print(word)
}

let newWord4 = pigLatin("string")
if let word = newWord4 {
    print(word)
}
