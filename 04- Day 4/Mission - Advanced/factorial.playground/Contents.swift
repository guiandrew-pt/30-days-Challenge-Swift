import UIKit

//// Factorial
//// Factorial for 6
//var number6 = 6
//var factorial = 1
//
//for n in 1...number6 {
//    factorial *= n
//}
//print("Factorial of 6: \(factorial)")
//
//// Factorial for 16
//var number16 = 16
//factorial = 1
//
//for n in 1...number16 {
//    factorial *= n
//}
//print("Factorial of 16: \(factorial)")
//
//// Factorial for 16
//var number8 = 8
//factorial = 1
//
//for n in 1...number8 {
//    factorial *= n
//}
//print("Factorial of 8: \(factorial)")
//
//// Factorial for 49
//var number49 = 49
//factorial = 1
//var factorialBigNumber: Double = 1.0
//
//for n in 1...number49 {
//    factorialBigNumber *= Double(n)
//}
//print("Factorial of 49: \(factorialBigNumber)")
//
//// Factorial for 101
//var number101 = 101
//factorial = 1
//factorialBigNumber = 1.0
//
//for n in 1...number101 {
//    factorialBigNumber *= Double(n)
//}
//print("Factorial of 101: \(factorialBigNumber)")


// Using a function
func factorialOfAGivenNumber(number: Int) -> Double {
    var factorial = 1.0
    
    for n in 1...number {
        factorial *= Double(n)
    }
    
    return factorial
}

print("Factorial of 6: \(String(format: "%.0f", factorialOfAGivenNumber(number: 6)))")
print("Factorial of 16: \(String(format: "%.0f", factorialOfAGivenNumber(number: 16)))")
print("Factorial of 8: \(String(format: "%.0f", factorialOfAGivenNumber(number: 8)))")
print("Factorial of 49: \(String(format: "%.0f", factorialOfAGivenNumber(number: 49)))")
print("Factorial of 101: \(String(format: "%.0f", factorialOfAGivenNumber(number: 101)))")
