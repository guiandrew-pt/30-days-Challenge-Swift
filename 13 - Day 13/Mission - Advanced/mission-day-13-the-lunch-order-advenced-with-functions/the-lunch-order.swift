#!/usr/bin/swift

import Foundation

var isBuying = true
var totalCost = 0.00

print("=== THE LUNCH ORDER ===")
print()

func printInfo() {
    print("# Menu: #")
    print("1. Turkey Sandwich - $4.99\n2. Burrito - $3.99\n3. Cookie - $1.99")
    
    print()
    
    print("What item would you like to buy? Enter the number to select the item:")
    print("You can put all orders on one line, comma separated.")
}

func userOrders(orders: [String]) {
    for num in orders {
        switch num {
            case "1":
                totalCost += 4.99
            case "2":
                totalCost += 3.99
            case "3":
                totalCost += 1.99
            default:
                print("This \"\(num)\" is not a valid choice")
        }
    }
}

func printStopOrder() {
    print("Anything else? Enter ‘n’ to stop ordering")
}

func validateStop() {
    printStopOrder()
    
    let contOrdering = readLine() ?? ""
    
    print()
    
    if (contOrdering.lowercased() == "n".lowercased()) {
        isBuying = false
        showTotalToUser()
    }
}

func orderAnnotation() {
    let number = readLine() ?? ""
    
    // Will remove the whitespaces and split by the comma, this convert the string to an array of strings
    let orders = number.replacingOccurrences(of: " ", with: "").components(separatedBy: ",")
    
    userOrders(orders: orders)
}

func showTotalToUser() {
    if totalCost == 0 {
        print("You didn't choose items, so it's $0.00")
    } else {
        let formatter = String(format: "%.2f", totalCost)
        print("The total cost of your order is: $\(formatter)")
    }
}

while(isBuying) {
    printInfo()
    
    orderAnnotation()
    
    print()
    
    validateStop()
}



