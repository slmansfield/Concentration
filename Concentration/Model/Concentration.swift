//
//  Concentration.swift
//  Concentration
//
//  Created by Shawn Mansfield on 5/3/18.
//  Copyright © 2018 Shawn Mansfield. All rights reserved.
//

import Foundation

class Concentration {
   
    private(set) public var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {// vomputed property
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {\ // use assert to protect public functions from incorrect parameters
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index) chosen index not in the cards")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                    if cards[matchIndex].identifier == cards[index].identifier {
                        cards[matchIndex].isMatched = true
                        cards[index].isMatched = true
                    }
                    cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    init(numberOfPairsOfCards: Int) {
        // use assert to protect public functions from incorrect parameters
        assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards)), you must have at least one pair of cards")
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        // shuffle the cards - 4 lines of code
        for _ in cards.indices {
            let randomCardIndex = Int(arc4random_uniform(UInt32(cards.count - 1)))
            print(randomCardIndex)
            let randomCard = cards.remove(at: randomCardIndex)
            cards.append(randomCard)
        }
    }
}

extension Int {
    var arc4randomn: Int {
        return Int(arc4random_uniform(UInt32(self)))
    }
}
