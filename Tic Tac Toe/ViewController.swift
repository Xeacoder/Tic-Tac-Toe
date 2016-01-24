//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Ozan Demirel on 8.01.2016.
//  Copyright © 2016 Ozan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1 // 1 = noughts , 2 = crosses
    
    var gameActive = true
    
    var buttonStatus = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, ]
    
    var winningCombinations = [ [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6] ]
    
    @IBOutlet var resultLabel: UILabel!
    
    @IBOutlet var playAgainButton: UIButton!
    
    @IBAction func playAgainButtonPressed(sender: AnyObject) {
        
        gameActive = true
        
        activePlayer = 1
        
        buttonStatus = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, ]
        
        resultLabel.hidden = true
        resultLabel.center = CGPointMake(resultLabel.center.x - 500, resultLabel.center.y)
        
        playAgainButton.hidden = true
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 500, playAgainButton.center.y)
        
        var resettingButton: UIButton
        
        for var i = 0; i < 9; i++ {
            
            resettingButton = view.viewWithTag(i) as! UIButton
            
            resettingButton.setImage(nil, forState: .Normal)
            
        }
        
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        if buttonStatus[sender.tag] == 0 && gameActive {
            
            buttonStatus[sender.tag] = activePlayer
            
            if activePlayer == 1 {
                
                sender.setImage(UIImage(named: "cross.png"), forState: .Normal)
                
                activePlayer = 2
                
            } else {
                
                sender.setImage(UIImage(named: "nought.png"), forState: .Normal)
                
                activePlayer = 1
                
            }
            
            for combinations in winningCombinations {
                
                if (buttonStatus[combinations[0]] != 0 && buttonStatus[combinations[0]] == buttonStatus[combinations[1]] && buttonStatus[combinations[0]] == buttonStatus[combinations[2]]) {
                    
                    gameActive = false
                    
                    if buttonStatus[combinations[0]] == 1 {
                        
                        resultLabel.text = "Naughts have won!"
                        
                    } else {
                        
                        resultLabel.text = "Crosses have won!"
                        
                    }
                    
                    end()
                    
                }
                
            }
            
            if gameActive {
                
                gameActive = false
                
                for checking in buttonStatus {
                    
                    if checking == 0 {
                        
                        gameActive = true
                        
                    }
                    
                }
                
                if !gameActive {
                    
                    resultLabel.text = "It's a Draw!"
                    
                    end()
                    
                }
                
            }

        }
        
    }
    
    func end() {
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            
            self.resultLabel.hidden = false
            self.resultLabel.center = CGPointMake(self.resultLabel.center.x + 500, self.resultLabel.center.y)
            
            self.playAgainButton.hidden = false
            self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x + 500, self.playAgainButton.center.y)
            
        })
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
     
        resultLabel.hidden = true
        resultLabel.center = CGPointMake(resultLabel.center.x - 500, resultLabel.center.y)
        
        playAgainButton.hidden = true
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 500, playAgainButton.center.y)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

