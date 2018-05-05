//
//  Concentration.swift
//  Concentration
//
//  Created by Shawn Mansfield on 5/3/18.
//  Copyright © 2018 Shawn Mansfield. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        // prevent matched cards from being played again
        if !cards[index].isMatched {
            // if this is second face up card
           
            if let matchIndex = indexOfOneAndOnlyFaceUpCard {
                // check to make sure the current face up card wasn't retouched
                if matchIndex != index {
                    // two unique face up cards can now be check if they match
                    if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                    cards[index].isFaceUp = true
                    indexOfOneAndOnlyFaceUpCard = nil
                }
                } else {
                    for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                    }
                    cards[index].isFaceUp = true
                    indexOfOneAndOnlyFaceUpCard = index
                
                }
            }
        }
    
    
    init(numberOfPairsOfCards: Int) {
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
