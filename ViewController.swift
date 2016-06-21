//
//  ViewController.swift
//  Tapper
//
//  Created by Sibrian on 6/20/16.
//  Copyright © 2016 Sibrian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //create outlets for the UI elements 
    @IBOutlet weak var tapperLogoImageView: UIImageView!
    @IBOutlet weak var howManyTapsTextField: UITextField!
    @IBOutlet weak var playButton: UIButton!

    @IBOutlet weak var coinButton: UIButton!
    @IBOutlet weak var tapsLabel: UILabel!
    
    var maxTaps = 0
    var currentTaps = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playButtonTapped(sender: UIButton!) {
        
        if howManyTapsTextField.text != nil && howManyTapsTextField.text != "" {
            
            tapperLogoImageView.hidden = true
            howManyTapsTextField.hidden = true
            playButton.hidden = true
            
            coinButton.hidden = false
            tapsLabel.hidden = false
            
            maxTaps = Int(howManyTapsTextField.text!)!
            currentTaps = 0
            
            updateTapsLabel()
            
        }
    }
    
    @IBAction func coinButtonTapped(sender: UIButton!) {
        currentTaps += 1
        
        updateTapsLabel()
        
        if isGameOver() {
            restartGame()
        }
    }
    
    //check whether the game is over
    func isGameOver() -> Bool {
        if currentTaps >= maxTaps {
            return true
        } else {
            return false
        }
    }
    
    //restart the game
    func restartGame() {
        maxTaps = 0
        howManyTapsTextField.text = ""
        
        
        tapperLogoImageView.hidden = false
        howManyTapsTextField.hidden = false
        playButton.hidden = false
        
        coinButton.hidden = true
        tapsLabel.hidden = true
    }
    
    //update UI elements to either hide or show graphics
    func updateTapsLabel() {
        if currentTaps == 1 {
            tapsLabel.text = "\(currentTaps) tap"
        } else {
            tapsLabel.text = "\(currentTaps) taps"
        }
        
    }
}

