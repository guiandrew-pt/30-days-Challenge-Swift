#!/usr/bin/swift

// Mission Day 23 - Blackjack(Day 1 of 2) - Advanced
import Foundation

// enum to be the face of the cards
enum Face: String, CaseIterable {
    case Ace
    case Two
    case Three
    case Four
    case Five
    case Six
    case Seven
    case Eight
    case Nine
    case Ten
    case Jack
    case Queen
    case King
}

// Enum to be the suits of the cards
enum Suits: String, CaseIterable {
    case Spades
    case Clubs
    case Hearts
    case Diamonds
}

// Card itself
struct Card {
    var suits: Suits
    var face: Face
    var value: Int
}

// This class will be the deck of the cards
class Deck {
    var deck = [Card]()
    var index = -1
    
    init() {
        newDeck()
    }
    
    func newDeck() {
        for cardSuit in 0..<4 {
            for cardValue in 0..<13 {
                let aux = Card(suits: Suits.allCases[cardSuit], face: Face.allCases[cardValue], value: checkValuesOfCards(card: Face.allCases[cardValue])!)

                deck.append(aux)
            }
        }
    }
    
    func getCard() -> Card {
        index += 1
        return deck[index]
    }
    
    func shuffleDeck() {
        deck.shuffle()
    }
    
    func resetTheIndex() {
        index = -1
    }
}

// Class Pot, to hold the money together
class Pot {
    var pot = 0
    
    func addMoneyToPot(value: Int) {
        pot += value
    }
    
    func getTheMoneyIntPot() -> Int {
        return pot
    }
    
    func startOverPot() {
        pot = 0
    }
}

// This function will check the value of the card
func checkValuesOfCards(card: Face?) -> Int? {
    if let aux = card {
        switch aux {
            case Face.Ace:
                return 1
            case Face.Two:
                return 2
            case Face.Three:
                return 3
            case Face.Four:
                return 4
            case Face.Five:
                return 5
            case Face.Six:
                return 6
            case Face.Seven:
                return 7
            case Face.Eight:
                return 8
            case Face.Nine:
                return 9
            case Face.Ten, Face.Jack, Face.Queen, Face.King:
                return 10
        }
    }
    
    return nil
}

// Just a simple protocol
protocol ImplementName {
    var name: String { get }
}

// This class will be the generic player
class PlayerFactory: ImplementName {
    var cards: [Card]
    let name: String
    var balance = 500
    
    init(cards: [Card], name: String) {
        self.cards = cards
        self.name = name
    }

    func newCards() {
        cards.removeAll()
    }
    
    func addCard(card: Card) {
        cards.append(card)
    }
    
    func getBalance() -> Int {
        return balance
    }
    
    func sumMoney(value: Int) {
        balance += value
    }
    
    func subtractMoney(value: Int) {
        balance -= value
        
        if balance <= 5 {
            initialBalance()
        }
    }
    
    func initialBalance() {
        balance = 500
    }
}

// Extension method to calculate the value of the cards
extension PlayerFactory {
    func getTheValueOfcard() -> Int {
        var value = 0
        var isAnyAce = false

        for card in cards {
            let valueOfCard = checkValuesOfCards(card: card.face)

            if let aux = valueOfCard {
                value += aux
            }
            
            if card.face == Face.Ace {
                isAnyAce = true
            }
        }
        
        if isAnyAce && value <= 11 {
            value += 10
        }

        return value
    }
}

// Extension method to give the number of cards
extension PlayerFactory {
    func getNumberOfCards() -> Int {
        return cards.count
    }
}

// This will be the player 1(user), it inherit from the PlayerFactory
class Player: PlayerFactory {
    override init(cards: [Card], name: String) {
        super.init(cards: cards, name: name)
    }
}

// This is the array of names to the dealer
let names = [ "Luther King", "Mahatma Gandhi", "Robert Johnson", "Bruce Lee" ]
// This class will be the Dealer(CPU), it inherit from the PlayerFactory
class Dealer: PlayerFactory {
    override init(cards: [Card], name: String) {
        super.init(cards: cards, name: name)
    }
}

// Will print the info of the cards
func printCards(suit: Suits, face: Face) {
    print("\(face) of \(suit)")
}

// Will ask if the player want to hit
func wantToHit() -> Bool {
    print("You want to hit or stand? (Type H/S)")
    let answer = readLine()?.lowercased() ?? ""
    
    validateAnswer(answer: answer)
    
    return true
}

// Will validade the answer, if the player wont to stop or continue
func validateAnswer(answer: String) {
    if answer.contains("s") {
        validateTheEndOfGame(handPlayer1: handValuePlayer1Value, handPlayer2: handValuePlayer2Value, handDealer: handValueDealerValue)
        
        print()
        
        if !isSecondPlayer {
            isPlayer2Lose = true
        }
        
        if isPlayer1Lose && isPlayer2Lose {
            printAskStartOver()
            if startOver == "n" {
                isStop = true
            } else {
                makeReset()
            }
        }
    }
}

// Will print the cards for the players or dealer
func printHandValueDealerOrPlayers(str: String, value: Int) {
    print("The hand of the \(str) is: \(value)")
}

// Will print the name of the cards
func printCards(_ arr: [Card]) {
    for card in arr {
        //printCards(suit: card.suits, value: card.value) // For testing the values
        printCards(suit: card.suits, face: card.face)
    }
}

// Will add a card to the player
func addCardtoPlayer1() {
    player1.addCard(card: newDeck.getCard())
}

// Will add a card to the player
func addCardtoPlayer2() {
    player2.addCard(card: newDeck.getCard())
}

// Will add a card to the dealer
func addCardtoDealer() {
    dealer.addCard(card: newDeck.getCard())
}

// State of game
// Will validade if player(s) loses or dealer loses, or if they have 21
func validateTheStateOfGame(handPlayer1: Int, handPlayer2: Int, handDealer: Int) -> Bool {
    if handPlayer1 > 21 {
        return true
    } else if handPlayer2 > 21 {
        return true
    } else if handDealer > 21 {
        return true
    } else if handPlayer1 == 21 && handDealer == 21 || handPlayer2 == 21 && handDealer == 21 || handPlayer1 == 21 && handPlayer2 == 21 {
        return true
    } else if handPlayer1 == 21 {
        return true
    } else if handPlayer2 == 21 {
        return true
    } else if handDealer == 21 {
        return true
    } else {
        return false
    }
}

// This is the requests 6 and 7 are in this conditions
func validateTheEndOfGame(handPlayer1: Int, handPlayer2: Int, handDealer: Int) {
    if handPlayer1 > 21 && handPlayer2 > 21 {
        print("Player 1(\(player1.name)) busted!")
        print("Player 2(\(player2.name)) busted!")
        
        isPlayer1Lose = true
        isPlayer2Lose = true
    } else if handPlayer1 > 21 {
        print("Player 1(\(player1.name)) busted!")
        print("Player 1(\(player1.name)) Lose!")
        
        isPlayer1Lose = true
        handValuePlayer1Value = 0
    } else if handPlayer2 > 21 {
        print("Player 2(\(player2.name)) busted!")
        print("Player 2(\(player2.name)) Lose!")
        
        isPlayer2Lose = true
        handValuePlayer2Value = 0
    } else if handDealer > 21 {
        print("Dealer busted!")
        print("Dealer Lose!")
        
        if isPlayer1Lose {
            player1.sumMoney(value: newPot.getTheMoneyIntPot())
        }
        
        if isPlayer2Lose {
            player2.sumMoney(value: newPot.getTheMoneyIntPot())
        }
        
        isPlayer1Lose = true
        isPlayer2Lose = true
        
        if betPlayer1 == "y" {
            print("Player 1 balance: $\(player1.getBalance())")
        }
        

        if betPlayer2 == "y" {
            print("Player 2 balance: $\(player2.getBalance())")
        }
        
        newPot.startOverPot()
    } else if handPlayer1 > handDealer && handPlayer1 > handPlayer2 {
        if handPlayer1 == 21 {
            let numberCards = player1.getNumberOfCards()
            
            if numberCards == 2 {
                print("Blackjack")
                newPot.addMoneyToPot(value: 50)
            } else {
                print("21")
            }
        }
        print("Player 1(\(player1.name)) Win!")
        
        isPlayer1Lose = true
        isPlayer2Lose = true
        
        player1.sumMoney(value: newPot.getTheMoneyIntPot())
        
        if betPlayer1 == "y" {
            print("Your price: $\(player1.getBalance())")
        }
        
        if betPlayer2 == "y" {
            print("Player 2 balance: $\(player2.getBalance())")
        }
        
        newPot.startOverPot()
    } else if handPlayer2 > handDealer {
        if handPlayer2 == 21 {
            let numberCards = player2.getNumberOfCards()
            
            if numberCards == 2 {
                print("Blackjack")
                newPot.addMoneyToPot(value: 50)
            } else {
                print("21")
            }
        }
        print("Player 2(\(player2.name)) Win!")
        
        isPlayer1Lose = true
        isPlayer2Lose = true
        
        player2.sumMoney(value: newPot.getTheMoneyIntPot())
        
        if betPlayer2 == "y" {
            print("Your price: $\(player2.getBalance())")
        }
        
        if betPlayer1 == "y" {
            print("Player 1 balance: $\(player1.getBalance())")
        }
        
        newPot.startOverPot()
    } else if handPlayer2 < handDealer  {
        if handDealer == 21 {
            let numberCards = dealer.getNumberOfCards()
            
            if numberCards == 2 {
                print("Blackjack")
            } else {
                print("21")
            }
        }
        print("Dealer(\(dealer.name)) Win!")
        print("Money stay in the house!")
        
        isPlayer1Lose = true
        isPlayer2Lose = true
        
        dealer.sumMoney(value: newPot.getTheMoneyIntPot())
        
        if betPlayer1 == "y" || betPlayer2 == "s" {
            print("House win: $\(dealer.getBalance())")
        }
        
        if betPlayer1 == "y" {
            print("Player 1 balance: $\(player1.getBalance())")
        }
        

        if betPlayer2 == "y" {
            print("Player 2 balance: $\(player2.getBalance())")
        }
    } else if handDealer == handPlayer1 || handDealer == handPlayer2 || handPlayer2 == handPlayer1 {
        print("Push!")
        
        isPlayer1Lose = true
        isPlayer2Lose = true
    }
}

// Will print the dealer intro
func printDealerIntro() {
    print("Hello sr. my name is \(nameDealer) and I'm going to be the dealer tonight.")
    printAskName()
}

// Will ask the name of the first player
func printAskName() {
    print("What is your name sr.(Player 1)?")
    namePlayer1 = readLine() ?? ""
    print()
    
    print("Are you sr.\(namePlayer1), going to bet? (Y/N)")
    betPlayer1 = readLine()?.lowercased() ?? ""
    
    print()
    
    print("Are you going to join the game sr.(Player 2)? (Y/N)")
    enterGame = readLine()?.lowercased() ?? ""
    
    if (enterGame != "n") {
        pirntAskNameSecondPlayer()
    }
}

// Will ask the name of the second player
func pirntAskNameSecondPlayer() {
    print("And or name sr.(Player 2)?")
    namePlayer2 = readLine() ?? ""
    print()
    
    print("Are you sr.\(namePlayer2), going to bet? (Y/N)")
    betPlayer2 = readLine()?.lowercased() ?? ""
    
    print()
    
    isSecondPlayer = true
}

// Cards to the player, this will be the two initial cards for the first player
func addInitialCardsToPlayer1() {
    arrCardsPlayer1.append(newDeck.getCard())
    arrCardsPlayer1.append(newDeck.getCard())
}

// Cards to the player, this will be the two initial cards for the second player
func addInitialCardsToPlayer2() {
    arrCardsPlayer2.append(newDeck.getCard())
    arrCardsPlayer2.append(newDeck.getCard())
}

// Cards to the dealer, this will be the two initial cards for the dealer
func addInitialCardsToDealer() {
    arrCardsDealer.append(newDeck.getCard())
    arrCardsDealer.append(newDeck.getCard())
}

func printAskStartOver() {
    print("Start over? (Y/N)")
    startOver = readLine()?.lowercased() ?? ""
    print()
}

func printAskWhatIsBet(player: Int) {
    print("How much is your bet? (5/10/50/100/500/1000)")
    
    if let value = readLine() {
        if player == 1 {
            valueOfBetPlayer1 = Int(value) ?? 0
            
            newPot.addMoneyToPot(value: valueOfBetPlayer1)
            // This will be the house bet. I assume it's the same as the player
            newPot.addMoneyToPot(value: valueOfBetPlayer1)
            player1.subtractMoney(value: valueOfBetPlayer1)
        } else {
            valueOfBetPlayer2 = Int(value) ?? 0
            
            newPot.addMoneyToPot(value: valueOfBetPlayer2)
            // This will be the house bet. I assume it's the same as the player
            newPot.addMoneyToPot(value: valueOfBetPlayer2)
            player2.subtractMoney(value: valueOfBetPlayer2)
        }
    }
}

// Will do the reset and add 2 inittial cards to all
func makeReset() {
    newDeck.resetTheIndex()
    newDeck.shuffleDeck()
    
    player1.newCards()
    
    addCardtoPlayer1()
    if answerToHit {
        addCardtoPlayer1()
    }
    
    if isSecondPlayer {
        player2.newCards()
        
        addCardtoPlayer2()
        
        if answerToHit {
            addCardtoPlayer2()
        }
    }
    
    dealer.newCards()
    
    addCardtoDealer()
    
    if answerToHit {
        addCardtoDealer()
    }
    
    isPlayer2Lose = false
    isPlayer1Lose = false
    answerToHit = false
}

// Will print intro with the name of the game
func printTitleGame() {
    print("=== BLACKJACK ===")
    print()
}

/* ========================= */
/* ========================= */
/// Game Play
var isStop = false
var handValuePlayer1Value = 0
var handValuePlayer2Value = 0
var handValueDealerValue = 0
var namePlayer1: String = ""
var namePlayer2: String = ""
var answerToHit = false
var enterGame = ""
var startOver = ""
var isNotValidState = false
var isSecondPlayer = false
var numberOfPlayers = 0
var player1: Player
var player2: Player
var dealer: Dealer
// Will be the name of the dealer
let nameDealer = names.randomElement()!
var betPlayer1 = ""
var betPlayer2 = ""
var valueOfBetPlayer1 = 0
var valueOfBetPlayer2 = 0
var elseIsNotValidState = false
var isPlayer1Lose = false
var isPlayer2Lose = false

// Will create two arrays of type Card, one for the player and other to the dealer
var arrCardsPlayer1 = [Card]()
var arrCardsPlayer2 = [Card]()
var arrCardsDealer = [Card]()

// This will create a new Deack -> 52 cards, it'a the first request.
let newDeck = Deck()

// This will create a new Pot -> This and the bets of the player's are the requests 1 and 3
let newPot = Pot()

// This shuffle the Deck -> It's the third request
newDeck.shuffleDeck()

// This will be the two initial cards for the first player
addInitialCardsToPlayer1()

// This will be the two initial cards for the second player
addInitialCardsToPlayer2()

// This will be the two initial cards for the dealer
addInitialCardsToDealer()

// Will create the dealer
dealer = Dealer(cards: arrCardsDealer, name: nameDealer)

printTitleGame()
printDealerIntro()

// This will create the first player -> this and the dealer, makes the request four.
player1 = Player(cards: arrCardsPlayer1, name: namePlayer1)

// This will create a second player -> this makes the request four of the avanced mission.
player2 = Player(cards: arrCardsPlayer2, name: namePlayer2)

while !isStop {
    elseIsNotValidState = false

    if answerToHit {
        // Add another card to first player hand
        addCardtoPlayer1()
        
        if isSecondPlayer {
            // Add another card to second player hand
            addCardtoPlayer2()
        }
        
        // This is the request number 8, the dealer “hits” once they reach 17 points
        if handValueDealerValue <= 17 {
            // Add another card to dealer's hand
            addCardtoDealer()
        }
    }
    
    if !isPlayer1Lose {
        // Player 1 bet
        if betPlayer1  == "y" {
            print("Balannce of player 1: \(player1.getBalance())")
            
            printAskWhatIsBet(player: 1)
        }
        
        print()
        
        // Player 1
        printCards(player1.cards)
        handValuePlayer1Value = player1.getTheValueOfcard()
        printHandValueDealerOrPlayers(str: "player 1", value: handValuePlayer1Value)
        
        print()
    }
    
    if isSecondPlayer {
        if !isPlayer2Lose {
            // Player 2 bet
            if betPlayer2  == "y" {
                print("Balannce of player 2: \(player2.getBalance())")
                
                printAskWhatIsBet(player: 2)
            }
            
            print()
            
            // Player 2
            printCards(player2.cards)
            handValuePlayer2Value = player2.getTheValueOfcard()
            printHandValueDealerOrPlayers(str: "player 2", value: handValuePlayer2Value)
            
            print()
        }
    }
    
    // Dealer
    printCards(dealer.cards)
    handValueDealerValue = dealer.getTheValueOfcard()
    printHandValueDealerOrPlayers(str: "dealer", value: handValueDealerValue)
    
    print()
    
    // Will validate
    isNotValidState = validateTheStateOfGame(handPlayer1: handValuePlayer1Value, handPlayer2: handValuePlayer2Value, handDealer: handValueDealerValue)

    if isNotValidState {
        validateTheEndOfGame(handPlayer1: handValuePlayer1Value, handPlayer2: handValuePlayer2Value, handDealer: handValueDealerValue)
        
        print()
        
        if !isSecondPlayer {
            isPlayer2Lose = true
        }
        
        if isPlayer1Lose && isPlayer2Lose {
            printAskStartOver()
            
            // This is the request 2 -> start over
            if startOver == "n" {
                break
            } else {
                makeReset()
                elseIsNotValidState = true
            }
        }
    }
    
    if !elseIsNotValidState {
        // If the player want to hit
        answerToHit = wantToHit()
    }
}
