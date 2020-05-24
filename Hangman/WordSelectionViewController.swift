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
        setUI()
    }
    
    func setUI(){
        self.wordTextField.text = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "SelectionToGuess") {
            let destVC = segue.destination as! GuessViewController
            destVC.word = sender as? String
        }
    }
    
    @IBAction func confirmTapped(_ sender: Any) {
        
        var wordText = wordTextField.text?.uppercased()
        
        wordText = wordText?.trimmingCharacters(in: .whitespaces)
        if(wordText?.count == 0){
            let alert = UIAlertController(title: "Empty String", message: "Your word is BLANK!", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { _ in
                self.wordTextField.text = ""
            }))
            
            self.present(alert, animated: true)
        }
        performSegue(withIdentifier: "SelectionToGuess", sender: wordText)
        
    }
    
    
}
