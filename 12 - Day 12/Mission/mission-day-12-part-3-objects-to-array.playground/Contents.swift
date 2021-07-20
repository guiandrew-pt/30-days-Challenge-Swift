// mission day 12 - part 3 - Object to Array
let students = [
    "John": [
        "age": 27,
        "online": false
    ],
    "Jack": [
        "age": 32,
        "online": true
    ],
    "Jenn": [
        "age": 48,
        "online": false
    ],
    "Liz": [
        "age": 19,
        "online": true
    ]
]

var arr = [String]()
for (studentsKeys, studentsValuesKeys) in students {
    arr.append(studentsKeys)
    arr.append(contentsOf: studentsValuesKeys.keys)
}
print(arr)
