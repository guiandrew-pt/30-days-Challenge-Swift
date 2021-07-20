// Mission Day 11 - Advanced - Un-Multiple
func totalCount(from num1: Int, through num2: Int) -> Int {
    var totalCount = 0
    
    for i in num1...num2 {
        if i % 6 != 0 && i % 15 != 0 {
            totalCount += 1
        }
    }
    
    return totalCount
}

print(totalCount(from: 1, through: 200))
