#!/usr/bin/swift

// Mission Day 23 - Blackjack(Day 1 of 2)
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
        isStop = true
    }
}

// Will print the cards for the player or dealer
func printHandValueDealerOrPlayer(str: String, value: Int) {
    print("The hand of the \(str) is: \(value)")
}

// Will print the name of the cards
func printCards(_ arr: [Card]) {
    for card in arr {
        //printCards(suit: card.suits, value: card.value)
        printCards(suit: card.suits, face: card.face)
    }
}

// Will add a card to the player
func addCardtoPlayer() {
    player.addCard(card: newDeck.getCard())
}

// Will add a card to the dealer
func addCardtoDealer() {
    dealer.addCard(card: newDeck.getCard())
}

// State of game
// Will validade if player loses or dealer loses, or if they have 21
func validateTheStateOfGame(handPlayer: Int, handDealer: Int) -> Bool {
    if handPlayer > 21 {
        return true
    } else if handDealer > 21 {
        return true
    } else if handPlayer == 21 && handDealer == 21 {
        return true
    } else if handPlayer == 21 {
        return true
    } else if handDealer == 21 {
        return true
    } else {
        return false
    }
}

// This is the requests 6 and 7 are in this conditions
func validateTheEndOfGame(handPlayer: Int, handDealer: Int) {
    if handDealer == handPlayer {
        print("Push!")
    } else if handPlayer > 21 {
        print("Player(\(player.name)) busted!")
        print("Player(\(player.name)) Lose!")
    } else if handDealer > 21 {
        print("Dealer busted!")
        print("Dealer Lose!")
    } else if handPlayer > handDealer {
        if handPlayer == 21 {
            let numberCards = player.getNumberOfCards()
            
            if numberCards == 2 {
                print("Blackjack")
            } else {
                print("21")
            }
        }
        print("Player(\(player.name)) Win!")
    } else if handPlayer < handDealer {
        if handDealer == 21 {
            let numberCards = dealer.getNumberOfCards()
            
            if numberCards == 2 {
                print("Blackjack")
            } else {
                print("21")
            }
        }
        print("Dealer(\(dealer.name)) Win!")
    }
}

// Will print the dealer intro
func printDealerIntro() {
    print("Hello sr. my name is \(nameDealer) and I'm going to be the dealer tonight.")
    printAskName()
}

// Will ask the name of the player
func printAskName() {
    print("What is your name?")
    print()
    
    namePlayer = readLine() ?? ""
    print()
}

// Cards to the player, this will be the two initial cards for the player
func addInitialCardToPlayer() {
    arrCardsPlayer.append(newDeck.getCard())
    arrCardsPlayer.append(newDeck.getCard())
}

// Cards to the dealer, this will be the two initial cards for the dealer
func addInitialCardToDealer() {
    arrCardsDealer.append(newDeck.getCard())
    arrCardsDealer.append(newDeck.getCard())
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
var handValuePlayerValue = 0
var handValueDealerValue = 0
var namePlayer: String = ""
var answerToHit = false
var isNotValidState = false

// This will create a new Deack -> 52 cards, it'a the first request.
let newDeck = Deck()

// This shuffle the Deck -> It's the third request
newDeck.shuffleDeck()

// Will create two arrays of type Card, one for the player and other to the dealer
var arrCardsPlayer = [Card]()
var arrCardsDealer = [Card]()

// Will be the name of the dealer
let nameDealer = names.randomElement()!

// This will be the two initial cards for the player
addInitialCardToPlayer()

// This will be the two initial cards for the dealer
addInitialCardToDealer()

// Will create the dealer
var dealer = Dealer(cards: arrCardsDealer, name: nameDealer)

printTitleGame()
printDealerIntro()

// This will create a player -> this and the dealer, makes the request four.
var player = Player(cards: arrCardsPlayer, name: namePlayer)

while !isStop {
    if answerToHit {
        // Add another card to player's hand
        addCardtoPlayer()
        
        // This is the request number 8, the dealer “hits” once they reach 17 points
        if handValueDealerValue <= 17 {
            // Add another card to dealer's hand
            addCardtoDealer()
        }
    }
    
    // Player
    printCards(player.cards)
    handValuePlayerValue = player.getTheValueOfcard()
    printHandValueDealerOrPlayer(str: "player", value: handValuePlayerValue)

    print()
    
    // Dealer
    printCards(dealer.cards)
    handValueDealerValue = dealer.getTheValueOfcard()
    printHandValueDealerOrPlayer(str: "dealer", value: handValueDealerValue)
    
    print()
    
    // Will validate
    isNotValidState = validateTheStateOfGame(handPlayer: handValuePlayerValue, handDealer: handValueDealerValue)

    if isNotValidState {
        break
    }
    
    // If the player want to hit
    answerToHit = wantToHit()
}

print()

validateTheEndOfGame(handPlayer: handValuePlayerValue, handDealer: handValueDealerValue)
