// Part 2 - Grade
func grades(grade: Int) {
    if grade > 90 {
        print("AA")
    } else if grade > 80 {
        print("AB")
    } else if grade > 70 {
        print("BB")
    } else if grade > 60 {
        print("BC")
    } else if grade > 50 {
        print("CC")
    } else if grade > 40 {
        print("CD")
    } else if grade > 30 {
        print("DD")
    } else {
        print("FF")
    }
}

grades(grade: 90)
grades(grade: 30)
grades(grade: 55)
