//
//  ResultsViewController.swift
//  Roshambo
//
//  Created by Mohammad Awwad on 10/25/16.
//  Copyright © 2016 awwadeto. All rights reserved.
//

import Foundation
import UIKit

class ResultsViewController : UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultImage: UIImageView!
    var userChoice: String!
    var opponentChoice: String!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Generate a random choice for the oponent
        let choices = ["Rock", "Paper", "Scissors"]
        let randomIndex = Int(arc4random() % 3)
        opponentChoice = choices[randomIndex]
        
        displayResult()
    }
    
    // MARK: - UI
    
    // The displayResult method generates the image and message for the results of a match.
    
    private func displayResult() {
        
        var imageName = ""
        var text : String
        var youWon: Bool = false
        let matchup = "\(userChoice!) vs. \(opponentChoice!)"
        
        // Handle the tie
        if userChoice == opponentChoice {
            resultImage.image = UIImage(named: "tie")
            resultLabel.text = "\(matchup): it's a tie!"
            return
        }
        
        // Otherwise, figure out if you won
        switch (userChoice) {
            
        case "Rock":
            youWon = opponentChoice == "Scissors"
            
        case "Paper":
            youWon = opponentChoice == "Rock"
            
        default: // Scissors
            youWon = opponentChoice == "Paper"
        }
        
        // Create the text
        if youWon {
            text = "You Won! \(matchup)"
            imageName = "\(userChoice!)-\(opponentChoice!)".lowercased()
        } else {
            text = "You Lost! \(matchup)"
            imageName = "\(opponentChoice!)-\(userChoice!)".lowercased()
        }
        
        // Update the UI components
        resultImage.image = UIImage(named: imageName)
        resultLabel.text = text
    }

    @IBAction func playAgain(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
