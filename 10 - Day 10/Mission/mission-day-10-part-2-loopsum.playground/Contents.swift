// Mission day 10 - Part 2 - LoopSum
var numbers = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
var evenTotal = 0

for i in 0..<numbers.count {
    if numbers[i] % 2 == 0 {
        // print(numbers[i]) // evens numbers
        evenTotal += numbers[i]
    }
}

/// OR
//let eventTotal = numbers.filter({$0 % 2 == 0}).reduce(0, +)

print("The total of evens numbers: \(evenTotal)")
