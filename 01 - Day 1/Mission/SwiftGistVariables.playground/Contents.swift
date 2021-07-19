// Variables in Swift

// Link -> https://gist.github.com/pythonicrubyist/33c5d0311ff08352cfdf
// Every variable in Swift is declared with the keyword "var".
// Swift is a type-safe language. It is strongly typed.
// All varables is Swift are of a specific type.
// Swift performs type inference if the type is not declared.

var s = "Hello World!" // Type inferred as string
var i = 7 // Type inferred as integer
var b = false // Type inferred as boolean

// b = "Hi" will throw a type error

// Type annotation means specifying the type without initializing the variable.
// : means "is of type"
var a : Int
var c : Character
var o : Bool

// You can specify both the default value and specify type.
var str : String = "Hi"


// COnstants in Swift
// Constants defined by the keyword "let" have to stay the same during the lifetime of the program.
// Use of constants are strongly recommended in Swift
// As a safty measure.
let r = 2

// String interpolation
var name = "Ramtin"
print("My name is \(name)")

// String Concatenation
var s1 = "a"
var s2 = "b"
print(s1 + ", " + s2)


// Type Casting
var i1 = 2
var d1 = 3.0
print(Double(i1) * d1)
