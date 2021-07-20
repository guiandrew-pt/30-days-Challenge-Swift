// mission day 12 - advanced - Sum Range
func arrTwoNumbers(_ arr: [Int]) -> Int {
    var one = 0
    var two = 0
    var result = 0
    
    // Will check if the array have no element
    if arr.count == 0 {
        return 0
    } else if arr.count == 1 { // Will check is the array have one element
        return arr[0]
    } else if arr.count > 2 { // Will check if have more than 2 elements, and pick the smallest and the largest value
        one = arr.min() ?? 0
        two = arr.max() ?? 0
    } else { // If have only 2 elements, will put the smallest on the var one and the largest on var two
        if arr[0] > arr[1] {
            one = arr[1]
            two = arr[0]
        } else {
            one = arr[0]
            two = arr[1]
        }
    }
    
    // Will loop only between the value on var one and var two, and do the sum of that numbers
    for i in one...two where (i >= one && i <= two) {
        result += i
    }
    
    return result
}

let arraytesting1 = [1, 4]
let arraytesting2 = [4, 3, 7]
let arraytesting3 = [3, 2, 5, 4, 1, 4, 7]

print(arrTwoNumbers(arraytesting1))
print(arrTwoNumbers(arraytesting2))
print(arrTwoNumbers(arraytesting3))
