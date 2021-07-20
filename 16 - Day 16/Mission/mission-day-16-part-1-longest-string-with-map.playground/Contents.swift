// Mission day 16 - Part 1 with the map - Longest String
func longestString(_ arr: [String]) -> String {
    let strLength = arr[0].count
    var longestStr = arr[0]
    
    arr.map({
        if $0.count > strLength {
            longestStr = $0
        }
    })
    
    return longestStr
}

let arr1 = ["hello", "Joe", "Card"]
let theLongestString1 = longestString(arr1)
print(theLongestString1)

let arr2 = ["hello", "Joe", "Card", "Silent"]
let theLongestString2 = longestString(arr2)
print(theLongestString2)
