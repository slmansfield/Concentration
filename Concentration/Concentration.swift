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
    var score = 0
    var flipCount = 0
    
    static var matchPoints = 20
    static var wasFaceUpPenalty = 10
    static var maxTimePanalty = 10
    
    private var date = Date()
    private var currentDate: Date { return Date() }
    var timeInterval: Int {
        return Int(-date.timeIntervalSinceNow)
    }
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    score += (Concentration.matchPoints - min(timeInterval, Concentration.maxTimePanalty))
                } else {
                    if cards[index].isSeen {
                        score -= (Concentration.wasFaceUpPenalty + min(timeInterval, Concentration.maxTimePanalty))
                    }
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil    // not one and only ...
            } else {
                // either no card or two cards face up
                for flipdownIndex in cards.indices {
                    cards[flipdownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
        flipCount += 1
        date = currentDate
    }
    
    init(numberOfPairsOfCards: Int) {
        var unShuffeldCards: [Card] = []
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            unShuffeldCards += [card, card]
        }
        //    TODO: Shuffle the cards
        while !unShuffeldCards.isEmpty {
            let randomIndex = unShuffeldCards.count.arc4Random
            let card = unShuffeldCards.remove(at: randomIndex)
            cards.append(card)
        }
    }
    
}
