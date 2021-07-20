// Part 1 - Are you broke
var balance = 0
var itemPrice = 0
var itemName = ""

func buyItem(iP: Int, b: Int, iN: String) {
    if b >= iP {
        print("Purchasing \(iN) for $\(iP)")
        print("Your balance after the purchasing is: $\(b - iP)")
    } else {
        print("You are broke and cannot afford this item. You need an additional $\(iP - b) to buy it!")
    }
}

buyItem(iP: 750, b: 1000, iN: "iPhone 7")
buyItem(iP: 1001, b: 1000, iN: "iPhone 8")
buyItem(iP: 1150, b: 990, iN: "iPad Pro")
buyItem(iP: 100, b: 200, iN: "Pen drive 1T")
buyItem(iP: 510, b: 389, iN: "Gaming Mouse")
buyItem(iP: 10, b: 9, iN: "Coffee")
buyItem(iP: 200, b: 800, iN: "Xiaomi")
buyItem(iP: 299, b: 303, iN: "Keyboard")
buyItem(iP: 400, b: 400, iN: "Lightning bolt")
buyItem(iP: 870, b: 659, iN: "Phones")

