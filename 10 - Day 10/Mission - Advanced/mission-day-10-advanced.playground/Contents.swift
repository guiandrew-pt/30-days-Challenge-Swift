// Mission day 10 - Advanced - Multiverse
let firstMultidimensional = [
    [1, 2, 3],
    [4, 5, 6]
]
// print(firstMultidimensional)

let secondMultidimensional = [
    [7, 8],
    [9, 10],
    [11, 12]
]
// print(secondMultidimensional)

var result = [[Int]]()
// This will give the length of the first matrix, and the length of the second matrix minus one:
result = Array(repeating: Array(repeating: 0, count: firstMultidimensional.count), count: secondMultidimensional.count - 1)

// The first loop is to loop through the rows
for row in 0..<firstMultidimensional.count {
    // The second loop is to loop through the columns
    for column in 0..<secondMultidimensional[0].count {
        // The third loop is to multiply the row to the column and sum that values. Example(first row * column), in this case will be 1 * 7 + 2 * 9 + 3 * 11
        for i in 0..<secondMultidimensional.count {
            // print("firstMultidimensional * secondMultidimensional \(firstMultidimensional[row][i] * secondMultidimensional[i][column])")
            result[row][column] += firstMultidimensional[row][i] * secondMultidimensional[i][column]
        }
    }
}

print(result)
