// Mission day 10 - Part 1 - Reverse
var words = ["ant", "awkward", "car", "zebra"]

words.reverse()
print(words)


var reverseWordsWithoutBuiltIn = [String]()
for index in stride(from: words.count - 1, through: 0, by: -1) {
    reverseWordsWithoutBuiltIn.append(words[index])
}

//print(reverseWordsWithoutBuiltIn)
words = reverseWordsWithoutBuiltIn
print(words)

////OR:
//for word in words {
//    reverseWordsWithoutBuiltIn.insert(word, at: 0)
//}
//print(reverseWordsWithoutBuiltIn)
