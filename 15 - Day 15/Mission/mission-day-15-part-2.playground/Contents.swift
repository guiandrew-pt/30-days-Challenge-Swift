// Mission day 15 - Part 2 - Root
func squareRoot(_ number: Double) -> Double {
    if number == 0 || number == 1 {
        return number
    }
    
    return number.squareRoot()
}

print(squareRoot(100))
print(squareRoot(576))
