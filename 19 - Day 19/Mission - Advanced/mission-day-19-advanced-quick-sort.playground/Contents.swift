// Mission Day 19 - Advanced - Quick Sort
struct QuickSort {
    var array = [Any]()
    
    func quickSort(_ arr: [Any]?) -> [Any]? {
        if var array = arr as? [Int] {
            array.sort()
            return array
        }

        if var array = arr as? [Float] {
            array.sort()
            return array
        }

        if var array = arr as? [Double] {
            array.sort()
            return array
        }
        
        if var array = arr as? [String] {
            array.sort()
            return array
        }
        
        return nil
    }
}


let arrayInt = [14, 2, 1, 12]
let structSortInt = QuickSort(array: arrayInt)
if let arraySort = structSortInt.quickSort(structSortInt.array) {
    print(arraySort)
}

let arrayString = ["Silent", "Two", "Array", "Toy", "By"]
let structSortString = QuickSort(array: arrayString)
if let arraySort = structSortString.quickSort(structSortString.array) {
    print(arraySort)
}

let arrayDouble = [14.9, 14.4, 11.2, 1.2]
let structSortDouble = QuickSort(array: arrayDouble)
if let arraySort = structSortDouble.quickSort(structSortDouble.array) {
    print(arraySort)
}
