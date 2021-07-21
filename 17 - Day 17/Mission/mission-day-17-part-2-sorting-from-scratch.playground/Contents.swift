// Mission Day 17 - Part 2 - Sorting From Scratch
func simpleSorting(_ arr: [Int]?) -> [Int]? {
    if var array = arr {
        var auxiliary = 0
        
        for i in 0..<array.count {
            for j in 0..<array.count {
                // Will compare if the value of the outer loop is lowest than the value of the inner loop, if is will put the value in the auxilliary variable, will put the value in the inner loop in the outer loop and the value of the auxilliary variable in the inner loop. NOTE: if you change the value from > to <, teh result will be from the highest to the lowest
                if array[j] > array[i] {
                    auxiliary = array[i]
                    array[i] = array[j]
                    array[j] = auxiliary
                }
            }
        }
        
        return array
    }
    
    return nil
}

let array1 = [14, 2, 1, 12]
if let arraySorted = simpleSorting(array1) {
    print(arraySorted)
}

let array2 = [7, 2, 3, 9, 1, 13]
if let arraySorted = simpleSorting(array2) {
    print(arraySorted)
}
