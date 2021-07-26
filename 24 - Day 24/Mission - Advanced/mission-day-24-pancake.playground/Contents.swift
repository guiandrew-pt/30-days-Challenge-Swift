// Mission Day 24 - Advanced: The Pancake Challenge
func pancakeChallenge(arr: [Int]?) -> (String?, [Int]?, [[Int]]?) {
    guard var auxArr = arr else {
        return (nil, nil, nil)
    }
    
    var spatula = 0
    var numberFlips = 0
    var isFinish = false
    var intermediateSteps = [[Int]]()

    while !isFinish {
        isFinish = true
        
        for i in 1..<auxArr.count {
            if auxArr[i - 1] > auxArr[i] {
                isFinish = false
                
                // This will "flip" the numbers, from the smallest to largest.
                spatula = auxArr[i - 1]
                auxArr[i - 1] = auxArr[i]
                auxArr[i] = spatula
                
                intermediateSteps.append(auxArr) // Will store the intermediate steps
            }
        }
    }
    
    numberFlips = intermediateSteps.count
    
    return ("\(numberFlips) flip(s)", auxArr, intermediateSteps)
}

let arrNumbers = [1, 4, 3, 5, 1, 3, 3]
let result = pancakeChallenge(arr: arrNumbers)

print("=== Initial State ===")
print(arrNumbers)

print("=== Number Flips ===")
if let flips = result.0 {
    print(flips)
}

print("=== Intermediate Steps ===")

if let intermediate = result.2 {
    print(intermediate)
}

print("=== Final result ===")
if let arr = result.1 {
    print(arr)
}

