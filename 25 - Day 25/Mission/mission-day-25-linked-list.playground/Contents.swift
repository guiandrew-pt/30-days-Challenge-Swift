import UIKit

class Node<T> {
    var value: T
    var next: Node?
    var previous: Node?
    
    init(value: T) {
        self.value = value
    }
}

class LinkedList<T> {
    typealias TheNode = Node<T>
    var head: TheNode?
    var tail: TheNode?

    // Will give the first element
    var firstNode: TheNode? {
        return head
    }

    // Will give the last element
    var lastNode: TheNode? {
        guard var node = head else {
            return nil
        }
        
        while let next = node.next {
            node = next
        }
        
        return node
    }
    
    // Will count the element in the linked list
    var count: Int {
        guard var node = head else {
            return 0
        }
        
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        
        return count
    }
    
    // Will print the linked list
    var printList: String {
        var stringArr = "["
        
        guard var node = head else {
            return stringArr + "]"
        }
        
        stringArr += "\(node.value)"
        
        while let next = node.next {
            node = next
            stringArr += ", \(node.value)"
        }
        
        return stringArr + "]"
    }
    
    // Will neatly print the linked list
    var neatlyElements: [Any]? {
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
    
    // Will add an element in the linked list
    func addElement(value: T) {
        let newNode = TheNode(value: value)
        
        if let lastNodeInList = lastNode { // Will do this if have at least one node
            newNode.previous = lastNodeInList
            lastNode?.next = newNode
        } else { // Will do if no nodes in list
            head = newNode
        }
    }
    
    // Will give the node in the given index
    func nodeIndex(index: Int) -> TheNode {
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
    
    // will add a node at given index
    func insertAt(value: T, index: Int) {
        let newNode = TheNode(value: value)
        
        if index == 0 {
            newNode.next = head
            head?.previous = newNode
            head = newNode
        } else {
            let previous = self.nodeIndex(index: index - 1)
            let next = previous.next
            
            newNode.previous = previous
            newNode.next = previous.next
            
            previous.next = newNode
            next?.previous = newNode
        }
    }
    
    // Remove a node
    func removeNode(node: TheNode) -> T {
        let previousNode = node.previous
        let nextNode = node.next
        
        if let previous = previousNode {
            previous.next = nextNode
        } else {
            head = nextNode
        }
        
        nextNode?.previous = previousNode
        
        node.previous = nil
        node.next = nil
        
        return node.value
    }
    
    // will remove a node at given index
    func removeAt(index: Int) -> T {
        let node = nodeIndex(index: index)
        
        return removeNode(node: node)
    }
    
    // Remove all
    func removeAll() {
        head = nil
        tail = nil
    }
}

let list = LinkedList<String>()
list.addElement(value: "Bruce")
print(list.count)
list.addElement(value: "Martin")
list.addElement(value: "Jim")
print(list.printList)
list.nodeIndex(index: 1).value
print(list.count)
print(list.nodeIndex(index: 0).value)

list.printList
list.insertAt(value: "Tim", index: 1)
print(list.printList)

list.removeAt(index: 1)
print(list.printList)
print(list.neatlyElements!)

list.removeAll()
print(list.printList)

let listInt = LinkedList<Int>()
listInt.addElement(value: 7)
listInt.addElement(value: 5)
listInt.addElement(value: 4)
listInt.addElement(value: 11)
print(listInt.printList)
print(listInt.neatlyElements!)
print(listInt.count)
