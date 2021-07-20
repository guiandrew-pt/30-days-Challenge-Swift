// Mission Day 11 - Part 1 - Loop Refresher
func numbers(num1: Int, num2: Int) {
    var a = 0
    var b = 0

    if num1 > num2 {
        a = num2
        b = num1
    } else {
        a = num1
        b = num2
    }
    
    for i in a...b {
        if i % 2 == 0 {
            print(i)
        }
    }
}

numbers(num1: 1, num2: 100)
