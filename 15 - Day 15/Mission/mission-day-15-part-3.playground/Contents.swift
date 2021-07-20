// Mission day 15 - Part 3 - Roots
func squareRoot(_ number: Double) -> Double {
    if number == 0 || number == 1 {
        return number
    }
    
    var i = 1.0
    var result = 1.0
    
    while result <= number {
        i += 1
        result = i * i
    }
    
    return i - 1.0
}

print(squareRoot(100))
print(squareRoot(576))
