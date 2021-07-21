// Mission Day 18 part 2 - Enhance
class Numbers {
    var number: Int?
    
    func remainderTheValueByTen(_ num: Int) -> Int {
        return num % 10
    }
    
    func addDigit(_ num: Int?) -> Int? {
        if let value = num {
            if value >= 0 {
                // Will convert to string
                var intNums = [Int]()
                var number = value
                
                // Will append the the remainder to the intNums array, will be the last number.
                let lastNumber = remainderTheValueByTen(value)
                intNums.append(lastNumber)
                
                // Will insert the others remainders into the intNums array
                while number != 0 {
                    number /= 10
                    intNums.insert(remainderTheValueByTen(number), at: 0)
                }
                
                // Will remove the firts element
                intNums.remove(at: 0)
                
                var resultArr = [Int]()
                
                // Will sum one to each element of the intNums, and append to the resultArr.
                intNums.map({
                    resultArr.append($0 + 1)
                })
                
                // Here, will joined the values from an array to a string
                let result = resultArr.map(String.init).joined()
                
                // will convert to int and return the number
                return Int(result)
            }
            
            return nil
        }
        
        return nil
    }
}

let numberTesting1 = Numbers()
numberTesting1.number = 787
if let result = numberTesting1.addDigit(numberTesting1.number) {
    print(result)
}

let numberTesting2 = Numbers()
numberTesting2.number = 998
if let result = numberTesting2.addDigit(numberTesting2.number) {
    print(result)
}

