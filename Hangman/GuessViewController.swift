//
//  GuessViewController.swift
//  Hangman
//
//  Created by Sujit Molleti on 5/20/20.
//  Copyright © 2020 Sujit Molleti. All rights reserved.
//

import UIKit

class GuessViewController: UIViewController {
    
    var word: String?
    var blankWord: String = ""
    @IBOutlet weak var guessWordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Guess"
        setUI()
    }
    
    func setUI(){
        for _ in 0..<word!.count{
            blankWord += "-"
        }
        guessWordLabel.text = blankWord
    }
    
    @IBAction func letterTapped(_ sender: UIButton){
        
        let letter: String = sender.currentTitle!
        
        if(( word?.contains(letter)) == true) {
            //print(true)
            //flip the dash
            
            flipDash(letter)
            
            //disable the button
            disableButton(sender)
        }else{
            print(false)
            //change the image
            //disable the button
            disableButton(sender)
        }
        
        //print(sender.currentTitle)
    }
    
    func disableButton(_ sender: UIButton){
        sender.isEnabled = false
        sender.backgroundColor = UIColor.systemGray4
    }
    
    func flipDash(_ letter: String){
        
    
        //Find the index(s) in word
        
        let letterChar: Character = letter.first!
        var temp: String = ""
        var index = word!.startIndex
        
        for char in word! {
            if(char == letterChar){
                temp += "\(word![index])"

            }else{
                temp += "\(blankWord[index])"
                //print("no match")
            }
            index = word!.index(after: index)
        }
        
        //change blankWord
        blankWord = temp
        
        //reloadTheLabel
        guessWordLabel.text = blankWord
        
    }
    
}
