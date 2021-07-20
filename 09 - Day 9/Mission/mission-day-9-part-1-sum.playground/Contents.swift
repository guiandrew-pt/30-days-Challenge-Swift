// Mission da 9 -> Part 1 - Sum
import UIKit

var odds = [5, 8, 14, 13, 29, 98]
var evens = [11, 6, 2, 87, 43, 22, 104]

var onlyOdds = odds.filter({$0 % 2 == 1})
print(onlyOdds)

var onlyEvens = evens.compactMap({$0 % 2 == 0 ? $0 : nil})
print(onlyEvens)

let numbersFromBothArrays = onlyOdds + onlyEvens
print(numbersFromBothArrays)

// This will sum the elements from the array odds and the array evens,
// and check if the array odds have more elements than the array evens or vice versa,
// if so, will add that elements in the end, after the sum.
func sumTowArrays(firstArr: [Int], secondArr: [Int]) -> [Int] {
    return zip(firstArr, secondArr).map(+) + (firstArr.count < secondArr.count ? secondArr[firstArr.count..<secondArr.count] : firstArr[secondArr.count..<firstArr.count])
}
let sumOfTwoArrays = sumTowArrays(firstArr: onlyOdds, secondArr: onlyEvens)
print(sumOfTwoArrays)

let sum = onlyOdds.reduce(0, +) + onlyEvens.reduce(0, +)
print(sum)
