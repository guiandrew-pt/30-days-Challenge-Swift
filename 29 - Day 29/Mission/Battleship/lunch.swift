#!/usr/bin/swift

import Foundation

var numberOfHits = 0
var isHit = false
var location: String? = ""
var arrLocation = [String]()
var play = ""
var isPlay = true
var isStart = false

struct Board {
    var arrBoard = [[String]]()
    
    init() {
        resetTheArrBoard()
    }
    
    mutating func resetTheArrBoard() {
        arrBoard = [
            ["*", "1", "2", "3"],
            ["A", " ", " ", " "],
            ["B", " ", " ", " "],
            ["C", " ", " ", " "],
        ]
    }
}

var arrBoardGame = Board()

var arrShipsInBorad = Board()

func printBoard() {
    for i in 0..<arrBoardGame.arrBoard.count {
        var str = ""
        for j in 0..<arrBoardGame.arrBoard[i].count {
            str += arrBoardGame.arrBoard[i][j]
            str += " "
        }

        print(str)
    }
}

func placeTheShipsRandom() {
    var i = 1
    while i <= 2 {
        let x = Int.random(in: 0..<arrShipsInBorad.arrBoard.count)
        let y = Int.random(in: 0..<arrShipsInBorad.arrBoard[0].count)
        
        if arrShipsInBorad.arrBoard[x][y] == " " {
            arrShipsInBorad.arrBoard[x][y] = "-"
            i += 1
        }
    }
}

func printStratedGame() {
    print("Press any key to start the game. (Press Enter)")
    let _ = readLine()

    print("==== BATTLESHIP ====")

    printBoard()
    placeTheShipsRandom()

    print()
}

func validateLocation(location: String) {
    var row = 0
    var col = 0
    var isValid = false
    
    switch location {
    case "a1":
        row = 1
        col = 1
        isValid = true
    case "a2":
        row = 1
        col = 2
        isValid = true
    case "a3":
        row = 1
        col = 3
        isValid = true
    case "b1":
        row = 2
        col = 1
        isValid = true
    case "b2":
        row = 2
        col = 2
        isValid = true
    case "b3":
        row = 2
        col = 3
        isValid = true
    case "c1":
        row = 3
        col = 1
        isValid = true
    case "c2":
        row = 3
        col = 2
        isValid = true
    case "c3":
        row = 3
        col = 3
        isValid = true
    default:
        print("You have to enter a valid position!")
    }
    
    if isValid {
        locationInTheBoard(row: row, col: col)
        isValid = false
    }
}

func locationInTheBoard(row: Int, col: Int) {
    if arrShipsInBorad.arrBoard[row][col] == "-" {
        numberOfHits += 1
        isHit = true
    }
    
    arrBoardGame.arrBoard[row][col] = "X"
}

func askLocation() {
    print("Enter a location to strike:")
    location = readLine()?.lowercased()
}

func resetTheGame() {
    arrBoardGame.resetTheArrBoard()
    arrShipsInBorad.resetTheArrBoard()
    arrLocation.removeAll()
    play = ""
    numberOfHits = 0
}

func validateTheAnswerLocation() {
    if let value = location {
        if !arrLocation.contains(value) {
            validateLocation(location: value)
            
            printBoard()
            print()
            
            if isHit {
                printHitShip()
            } else {
                printHitMissed()
            }
        } else {
            printAlreadyExist()
        }
    }
}

func printHitShip() {
    if numberOfHits == 1 {
        print("Hit. You have sunk a battleship. 1 ship remaining.")
    } else {
        print("You have destroyed all battleships. Would you like to play again? (Y/N)")
        play = readLine()?.lowercased() ?? ""
        validateThePlay(play: play)
        isStart = true
    }
    
    isHit = false
}

func validateThePlay(play: String) {
    if play == "y" {
        isPlay = true
    } else {
        isPlay = false
    }
}

func printHitMissed() {
    print("You have missed!")
}

func printAlreadyExist() {
    print("You have already picked this location. Missed!")
}

// #########################
// Start Game
printStratedGame()

while isPlay {
    if isStart {
        resetTheGame()
        printStratedGame()
        isStart = false
    }
    
    askLocation()
    
    print()
    
    validateTheAnswerLocation()
    
    arrLocation.append(location ?? "")
}


