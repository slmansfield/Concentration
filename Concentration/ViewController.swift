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
    }
    
    @IBOutlet var CardButtons: [UIButton]!
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    
    
    
}

