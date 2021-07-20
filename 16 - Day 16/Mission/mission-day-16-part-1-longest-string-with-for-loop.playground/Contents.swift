// Mission day 16 - Part 1 with the for loop - Longest String
func longestString(_ arr: [String]) -> String {
    let strLength = arr[0].count
    var longestStr = arr[0]
    
    for str in arr {
        if str.count > strLength {
            longestStr = str
        }
    }
    
    return longestStr
}

let arr1 = ["hello", "Joe", "Card"]
let theLongestString1 = longestString(arr1)
print(theLongestString1)

let arr2 = ["hello", "Joe", "Card", "Silent"]
let theLongestString2 = longestString(arr2)
print(theLongestString2)
