//
//  Card.swift
//  Concentration
//
//  Created by Shawn Mansfield on 5/3/18.
//  Copyright © 2018 Shawn Mansfield. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var cardFactoryIdentifer = 0
    
    static func getUniqueIdentifier() -> Int {
        cardFactoryIdentifer += 1
        return cardFactoryIdentifer
    }
    
    init(numberOfPairsOfCards: Int) {
        self.identifier = Card.getUniqueIdentifier()
    }
}
