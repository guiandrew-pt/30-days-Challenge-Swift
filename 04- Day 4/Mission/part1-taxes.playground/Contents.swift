import UIKit

// Shopping Cart List
let butter = 2.28
let meat = 25.86
let fish = 30.63
let potato = 7.92
let beer = 5.90
let water = 5.91

// Result without Taxes and without coupon
let costWithoutTaxes = butter + meat + fish + potato + beer + water // 78.50

// Coupon
let coupon = 25 //25%
let valueOfThePercentage = (Double(coupon) / 100.00) * costWithoutTaxes // Value of percentage applied to the total

let priceAfterDiscount = costWithoutTaxes - valueOfThePercentage // 58.875
let priceAfterDiscountStr = String(format: "%.2f", priceAfterDiscount) // 58.88

// Taxes
let taxes = 7.75 // 7.75%
let taxesRate = taxes / 100 * priceAfterDiscount
let taxesRateStr = String(format: "%.2f", taxesRate) // 4.56

// Final Price
let finalPrice = priceAfterDiscount + taxesRate
let finalPriceStr = "$\(String(format: "%.2f", finalPrice))" // 63.44
print(finalPriceStr)














