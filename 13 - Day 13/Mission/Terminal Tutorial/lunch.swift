#!/usr/bin/swift

print("Enter your name:")
let name = readLine() ?? ""

if name.count > 0 {
    print("Hello, \(name)!")
} else {
    print("Hello, stranger!")
}
