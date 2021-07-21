// Mission Day 18 - Advanced - Binary Converter
class BinaryConverter {
    var anything: Any?
    
    func convertToBinary(_ value: Any?) -> Any? {
        if let something = value as? Int {
            // NOTE: radix will give a value in base 10, or some other specified base. Like it says in the discription.
            return String(something, radix: 2)
        }
        
        if let something = value as? Double {
            let num = Int(something)
            return String(num, radix: 2)
        }
        
        if let something = value as? String {
            let num = Int(something) ?? 0
            return String(num, radix: 2)
        }
        
        return nil
    }
}

let binary1 = BinaryConverter()
binary1.anything = 103
let result1 = binary1.convertToBinary(binary1.anything)
if let value = result1 {
    print(value)
}

let binary2 = BinaryConverter()
binary2.anything = "103"
let result2 = binary2.convertToBinary(binary2.anything)
if let value = result2 {
    print(value)
}

let binary3 = BinaryConverter()
binary3.anything = 103.89
let result3 = binary3.convertToBinary(binary3.anything)
if let value = result3 {
    print(value)
}
