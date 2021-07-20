// Mission day 8 - Part 1 - Fruity
var fruit = ["apple", "banana", "orange", "strawberry"]

if let index = fruit.firstIndex(of: "orange") {
    fruit.remove(at: index)
    print(fruit)
}

fruit.popLast()
print(fruit)

fruit.insert("pear", at: 0)
print(fruit)

fruit.removeAll()
print(fruit)
