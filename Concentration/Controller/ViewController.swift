//
//  ViewController.swift
//  Concentration
//
//  Created by Shawn Mansfield on 5/3/18.
//  Copyright © 2018 Shawn Mansfield. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet private var cardButtons: [UIButton]!
    @IBOutlet private weak var flipCountLabel: UILabel!
    @IBOutlet private weak var playAgainBtn: UIButton!
    
    var emojiChoices = ["🕷", "🦋", "🐝", "🐔", "🐙", "🙉", "🐴", "🐟"]
    var emoji = [Int: String]()
    
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {
        // set the number of cards to 1/2 the number of card buttons
        print(cardButtons.count)
        return (cardButtons.count + 1) / 2
    }
    
    private(set) var flipCounter = 0 {
        didSet {
            flipCountLabel.text = "Flips:  \(flipCounter)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    
    private func updateViewfromModel(){
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
            }
        }
    }
    
    private func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil , emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count - 1)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
   
    
    // underbar in function is from an Objective-C function, which doesn't have the
    // inside/outside name requirement
    @IBAction private func touchCard(_ sender: UIButton) {
           flipCounter += 1
           if let cardNumber = cardButtons.index(of: sender) {
               game.chooseCard(at: cardNumber)
               updateViewfromModel()
           } else {
               print("Chosen card was not in CardButtons")
           }
       }
    
    @IBAction private func playAgainBtn(_ sender: UIButton) {
        
    }
    
}

