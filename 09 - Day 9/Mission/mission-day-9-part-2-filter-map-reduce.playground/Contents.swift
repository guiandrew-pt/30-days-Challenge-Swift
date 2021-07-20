// Mission da 9 -> Part 2 - filter, Map, Reduce
import UIKit

var states = ["alaska", "alabama", "arkansas", "missouri", "texas", "nevada", "california"]

let filterByLetterA = states.filter({ !$0.starts(with: "a") })
print(filterByLetterA)

let map3Characters = filterByLetterA.map({ $0.prefix(3) })
print(map3Characters)

let reduceCountCharacters = map3Characters.reduce(0, {
    $0 + $1.count
})
print(reduceCountCharacters)

