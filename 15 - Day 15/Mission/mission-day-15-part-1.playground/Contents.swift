// Mission day 15 - Part 1 - Digits
func sumDigits(_ number: Int) -> Int {
    var num = number
    var sum = 0
    
    while num != 0 {
        // Will split off the last digit
        sum += num % 10
        // Remove the last digit by diving by 10
        // The digits will move to the right and divide results in whole number.
        num /= 10
    }
    
    return sum
}

print(sumDigits(412))


