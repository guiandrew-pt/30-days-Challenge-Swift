// Mission Day 17 - Part 1 - Simple Sorting
func simpleSorting(_ arr: [Int]?) -> [Int]? {
    if let array = arr {
        return array.sorted()
    }
    
    return nil
}

let array = [14, 2, 1, 12]
if let arraySorted = simpleSorting(array) {
    print(arraySorted)
}

