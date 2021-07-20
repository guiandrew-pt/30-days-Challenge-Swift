// Part 1 - Traffic
func traffic(status: String, emergencyVehicle: Bool, isInIntersection: Bool) -> String {
    if isInIntersection {
        return "You can drive"
    } else if emergencyVehicle {
        return "Do not drive"
    } else if status == "Green" {
        return "You can drive"
    } else if status == "Yellow" {
        return "Prepare to stop"
    } else if status == "Red" {
        return "Do not drive"
    } else {
        return "Value not valid!"
    }
}

print(traffic(status: "Yellow", emergencyVehicle: false, isInIntersection: false))
print(traffic(status: "Yellow", emergencyVehicle: true, isInIntersection: false))
print(traffic(status: "Red", emergencyVehicle: false, isInIntersection: true))
