//
//  WordSelectionViewController.swift
//  Hangman
//
//  Created by Sujit Molleti on 5/20/20.
//  Copyright © 2020 Sujit Molleti. All rights reserved.
//

import UIKit

class WordSelectionViewController: UIViewController {

    @IBOutlet weak var wordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pick A Word"
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "SelectionToGuess") {
            let destVC = segue.destination as! GuessViewController
            
            destVC.word = sender as? String
        }
    }
    
    @IBAction func confirmTapped(_ sender: Any) {
        
        let wordText = wordTextField.text?.uppercased()
        performSegue(withIdentifier: "SelectionToGuess", sender: wordText)
        
    }
    
}
