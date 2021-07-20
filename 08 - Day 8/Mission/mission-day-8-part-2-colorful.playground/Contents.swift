// Mission day 8 - Part 2 - Colorful
var colors = ["blue", "red", "green", "yellow", "black", "white"]
var moreColors = ["purple", "magenta", "pink"]

colors.removeSubrange(3..<4) // Remove the "yellow"
print(colors)

colors.append(contentsOf: moreColors)
print(colors)
