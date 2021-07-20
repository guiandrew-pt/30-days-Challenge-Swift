// Advanced - forEach
var numbers = [-1, -2, 20, 60, 77]

numbers.forEach {
    if $0 > 0 {
        print($0)
    }
}
