#!/usr/bin/swift

import Foundation

var isBuying = true
var totalCost = 0.00

print("=== THE LUNCH ORDER ===")
print()
while(isBuying) {
    print("# Menu: #")
    print("1. Turkey Sandwich - $4.99\n2. Burrito - $3.99\n3. Cookie - $1.99")
    
    print()
    
    print("What item would you like to buy? Enter the number to select the item:")

    let number = readLine()

    switch number {
        case "1":
            totalCost += 4.99
        case "2":
            totalCost += 3.99
        case "3":
            totalCost += 1.99
        default:
            print("That is not a valid choice")
    }
    
    print()
    
    print("Anything else? Enter ‘n’ to stop ordering")
    let contOrdering = readLine() ?? ""
    
    print()
    
    if (contOrdering.lowercased() == "n".lowercased()) {
        isBuying = false
    }
}

if totalCost == 0 {
    print("You didn't choose items, so it's $0.00")
} else {
    let formatter = String(format: "%.2f", totalCost)
    print("The total cost of your order is: $\(formatter)")
}
