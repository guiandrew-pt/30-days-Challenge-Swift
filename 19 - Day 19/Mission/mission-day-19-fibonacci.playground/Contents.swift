// Mission Day 19 - Fibonacci
struct Fibonacci {
    var num: Int?
    
    func fibonacci(num: Int?) -> Int? {
        if let number = num {
            var arr = [1, 1]
            var result = 0
            
            // Will loop and add the numbers in fibonacci order to the arr array, and will stop the loop when the auxilliary variable is equal or bigger than the number.
            for i in 2...number {
                let aux = arr[i - 2] + arr[i - 1]
                arr.append(aux)
                
                if aux >= number {
                    break
                }
            }

            // This second loop will loop through the arr array and sum the odds numbers less than or equal to number.
            // NOTE: It can be done all in one loop, but ir is easier to understand in two loops.
            for i in 0..<arr.count {
                if (arr[i] % 2 != 0) && arr[i] <= number {
                    result += arr[i]
                }
            }
            
            return result
        }
        
        return nil
    }
}


var sumOddFibonacci1 = Fibonacci(num: 10)
let sumOdd1 = sumOddFibonacci1.fibonacci(num: sumOddFibonacci1.num)
if let sum = sumOdd1 {
    print(sum)
}

var sumOddFibonacci2 = Fibonacci(num: 30)
let sumOdd2 = sumOddFibonacci2.fibonacci(num: sumOddFibonacci2.num)
if let sum = sumOdd2 {
    print(sum)
}

var sumOddFibonacci3 = Fibonacci(num: 12)
let sumOdd3 = sumOddFibonacci3.fibonacci(num: sumOddFibonacci3.num)
if let sum = sumOdd3 {
    print(sum)
}
