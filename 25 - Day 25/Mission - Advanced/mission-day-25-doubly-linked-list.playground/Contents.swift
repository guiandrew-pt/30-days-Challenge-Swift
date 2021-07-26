import UIKit

class Node<T>: Equatable {
    var value: T
    var next: Node?
    var previous: Node?
    
    init(value: T, next: Node<T>?, previous: Node<T>?) {
        self.value = value
        self.next = next
        self.previous = previous
    }
    
    // This is required by the Equatable
    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.next == rhs.next
    }
}

class DoublyLinkedList<T> {
    var head: Node<T>? = nil
    var tail: Node<T>? = nil
    var size: Int = 0
    
    // Will check if is empty
    var isEmpty: Bool {
        head == nil
    }
    
    // Will give an mode at given index
    func nodeIndex(index: Int) -> Node<T>? {
        if index == 0 {
            return head!
        } else {
            var node = head?.next
            
            for _ in 1..<index {
                node = node?.next
                
                if node == nil {
                    break
                }
            }
            
            return node!
        }
    }
    
    // Will add a value
    func addElement(value: T) {
        let newNode = Node(value: value, next: nil, previous: nil)
        
        guard head != nil else {
            head = newNode
            tail = newNode
            size += 1
            
            return
        }
        
        tail?.next = newNode
        newNode.previous = tail
        tail = newNode
        
        size += 1 // Will increase by 1 every time it add an element
    }
    
    // Will add a value at given index
    func addElementAt(index: Int, value: T) -> Bool {
        if let node = nodeIndex(index: index) {
            if node == tail {
                addElement(value: value)
                return true
            }
            
            let newNode = Node(value: value, next: node.next, previous: node)
            
            if let auxNode = node.next {
                node.next = newNode
                auxNode.previous = newNode
                return true
            }
        }
        
        return false
    }
    
    // Will sort the values ascending
    var sortAscElements: [Any]? {
        if (head?.value as? String) != nil {
            var arrStr = [String]()
            
            guard var node = head else {
                return nil
            }
    
            arrStr.append("\(node.value)")
            while let next = node.next {
                node = next
                arrStr.append("\(node.value)")
            }
    
            arrStr.sort()
            return arrStr
        }

        if (head?.value as? Int) != nil {
            var arrInt = [Int]()
            
            guard var node = head else {
                return nil
            }
            
            arrInt.append(node.value as? Int ?? 0)
            
            while let next = node.next {
                node = next
                arrInt.append(node.value as? Int ?? 0)
            }
            
            arrInt.sort()
            return arrInt
        }
        
        if (head?.value as? Double) != nil {
            var arrDouble = [Double]()
            
            guard var node = head else {
                return nil
            }
            
            arrDouble.append(node.value as? Double ?? 0)
            
            while let next = node.next {
                node = next
                arrDouble.append(node.value as? Double ?? 0)
            }
            
            arrDouble.sort()
            return arrDouble
        }
        
        if (head?.value as? Float) != nil {
            var arrFloat = [Float]()
            
            guard var node = head else {
                return nil
            }
            
            arrFloat.append(node.value as? Float ?? 0)
            
            while let next = node.next {
                node = next
                arrFloat.append(node.value as? Float ?? 0)
            }
            
            arrFloat.sort()
            return arrFloat
        }
        
        return nil
    }
    
    // Will sort the values ascending
    var sortDescElements: [Any]? {
        if (head?.value as? String) != nil {
            var arrStr = [String]()
            
            guard var node = head else {
                return nil
            }
    
            arrStr.append("\(node.value)")
            while let next = node.next {
                node = next
                arrStr.append("\(node.value)")
            }
    
            arrStr.sort(by: >)
            return arrStr
        }

        if (head?.value as? Int) != nil {
            var arrInt = [Int]()
            
            guard var node = head else {
                return nil
            }
            
            arrInt.append(node.value as? Int ?? 0)
            
            while let next = node.next {
                node = next
                arrInt.append(node.value as? Int ?? 0)
            }
            
            arrInt.sort(by: >)
            return arrInt
        }
        
        if (head?.value as? Double) != nil {
            var arrDouble = [Double]()
            
            guard var node = head else {
                return nil
            }
            
            arrDouble.append(node.value as? Double ?? 0)
            
            while let next = node.next {
                node = next
                arrDouble.append(node.value as? Double ?? 0)
            }
            
            arrDouble.sort(by: >)
            return arrDouble
        }
        
        if (head?.value as? Float) != nil {
            var arrFloat = [Float]()
            
            guard var node = head else {
                return nil
            }
            
            arrFloat.append(node.value as? Float ?? 0)
            
            while let next = node.next {
                node = next
                arrFloat.append(node.value as? Float ?? 0)
            }
            
            arrFloat.sort(by: >)
            return arrFloat
        }
        
        return nil
    }
}

let list = DoublyLinkedList<Int>()
list.addElement(value: 7)
list.addElement(value: 9)
list.addElement(value: 5)

list.addElementAt(index: 2, value: 11)

if let sortAsc = list.sortAscElements {
    print(sortAsc)
}

if let sortDesc = list.sortDescElements {
    print(sortDesc)
}

