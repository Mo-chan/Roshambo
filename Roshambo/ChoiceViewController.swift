//
//  ChoiceViewController.swift
//  Roshambo
//
//  Created by Mohammad Awwad on 10/25/16.
//  Copyright © 2016 awwadeto. All rights reserved.
//

import UIKit

class ChoiceViewController: UIViewController {

    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var papperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func playRock(_ sender: UIButton) {
        let resultsViewController = self.storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
        
        resultsViewController.userChoice = getUserShape(sender: sender)
        present(resultsViewController, animated: true, completion: nil)
    }
    
    @IBAction func playPaper(_ sender: UIButton) {
        performSegue(withIdentifier: "play", sender: sender)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "play" {
            let resultsViewController = segue.destination as! ResultsViewController
            resultsViewController.userChoice = getUserShape(sender: sender as! UIButton)
        }
    }
    
    private func getUserShape(sender: UIButton) -> String {
        
        if sender == rockButton {
            return "Rock"
        }
            
        else if sender == papperButton {
            return "Paper"
        }
            
        else {
            return "Scissors"
        }
    }
}

