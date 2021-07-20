// Mission day 12 - Part 1 - Objects
var cars = [
    "Honda" : "Crv",
    "Jeep" : "Wrangler",
    "Chrysler" : "Pacifica",
    "Ford" : "F150"
]

// print(cars)

for key in cars.keys {
    if key == "Ford" {
        cars["Ford"] = nil
        break
    }
}

print(cars)
