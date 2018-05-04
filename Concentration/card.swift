//
//  card.swift
//  Concentration
//
//  Created by Shawn Mansfield on 5/3/18.
//  Copyright © 2018 Shawn Mansfield. All rights reserved.
//

import Foundation

struct card {
    
    var isMatched = false
    var isFaceUp = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        card.identifierFactory += 1
        return identifierFactory
    }
    
    init(numberOfPairsOfCards: Int) {
        self.identifier = card.getUniqueIdentifier()
    }
}
