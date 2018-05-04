//
//  ViewController.swift
//  Concentration
//
//  Created by Shawn Mansfield on 5/3/18.
//  Copyright © 2018 Shawn Mansfield. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    private var flipCounter = 0 {
        didSet {
            flipCountLabel.text = "Flips:  \(flipCounter)"
        }
    }
    

    @IBAction func touchCard(_ sender: UIButton) {
        flipCounter += 1
        cardButton.setTitle("?", for: UIControlState.normal)
        cardButton.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
    }
        
        
    @IBOutlet weak var cardButton: UIButton!
    
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    
    
    
}

