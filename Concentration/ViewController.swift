//
//  ViewController.swift
//  Concentration
//
//  Created by Shawn Mansfield on 5/3/18.
//  Copyright © 2018 Shawn Mansfield. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {
        return (cardButtons.count + 1) / 2
    }
    
    private var flipCounter = 0 {
        didSet {
            flipCountLabel.text = "Flips:  \(flipCounter)"
        }
    }
    

    @IBAction func touchCard(_ sender: UIButton) {
        flipCounter += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewfromModel()
        } else {
            print("Chosen card was not in CardButtons")
        }
    }
    
    func updateViewfromModel(){
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            print("we are updating the view")
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                print("this is working")
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
                print("we should be face up")
            }
        }
    }
    
    var emojiChoices = ["🕷", "🧛‍♂️"]
    var emoji = [Int: String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil , emojiChoices.count > 0 {
                let randomIndex = Int(arc4random_uniform(UInt32(cardButtons.count - 1)))
                emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
    
    @IBOutlet var cardButtons: [UIButton]!

    @IBOutlet weak var flipCountLabel: UILabel!
    
}

