// Mission Day 17 - Advanced - Merge Sort
func mergeSort(_ arr: [Any]?) -> [Any]? {
    if let array = arr as? [Int] {
        return array.sorted()
    }

    if let array = arr as? [Float] {
        return array.sorted()
    }
    
    if let array = arr as? [Double] {
        return array.sorted()
    }
    
    if let array = arr as? [String] {
        return array.sorted()
    }
    
    return nil
}

let arrayInt = [14, 2, 1, 12]
if let arraySorted = mergeSort(arrayInt) {
    print(arraySorted)
}

let arrayString = ["Silent", "Two", "Array", "Toy", "By"]
if let arraySorted = mergeSort(arrayString) {
    print(arraySorted)
}

let arrayDouble = [14.9, 14.4, 11.2, 1.2]
if let arraySorted = mergeSort(arrayDouble) {
    print(arraySorted)
}

