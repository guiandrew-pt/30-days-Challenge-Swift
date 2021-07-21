// Mission Day 18 part 1 - Add Digit
class Numbers {
    var number: Int?
    
    func addDigit(_ num: Int?) -> Int? {
        if let value = num {
            if value >= 0 {
                // Will convert to string
                let numConvertToString = String(value)
                var intNums = [Int]()
                
                // Wil loop through all single value in the string,
                // that single value in the loop are type char,
                // then will convert to string, and convert to int,
                // then will sum one, and append to intNum array,
                // the value is force unwrapped(!), beacuse it's validated before.
                numConvertToString.map({
                    intNums.append(Int(String($0))! + 1)
                })
                
                // Here, will joined the values from an array to a string
                let result = intNums.map(String.init).joined()
                
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

let numberTesting3 = Numbers()
numberTesting3.number = 0
if let result = numberTesting3.addDigit(numberTesting3.number) {
    print(result)
}
