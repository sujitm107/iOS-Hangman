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
    
    var imageArray: [UIImage?] = [
        UIImage(named: "Hook"),
        UIImage(named: "Head"),
        UIImage(named: "Body"),
        UIImage(named: "LegOne"),
        UIImage(named: "LegTwo"),
        UIImage(named: "GameOver")
    ]
    
    @IBOutlet weak var guessWordLabel: UILabel!
    @IBOutlet weak var guessProgressView: UIProgressView!
    //progressView has a min: 0.0, max: 1
    @IBOutlet weak var hangImageView: UIImageView!
    @IBOutlet weak var definitionLabel: UILabel!
    
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
        guessProgressView.progress = 0
        hangImageView.image = imageArray[0]
        
        definitionLabel.text = "Definition: "
    }
    
    @IBAction func letterTapped(_ sender: UIButton){
        
        let letter: String = sender.currentTitle!
        
        if(( word?.contains(letter)) == true) { //good guess
            //print(true)
            //flip the dash
            flipDash(letter)
            //disable the button
            disableButton(sender)
        }else{ //bad guess
            //change progressView
            guessProgressView.setProgress(guessProgressView.progress + 0.2, animated: true)
            //change the image
            
            let imageIndex: Int = Int((guessProgressView.progress * 5))
            hangImageView.image = imageArray[imageIndex]
            
            //disable the button
            disableButton(sender)
        }
        
        gameOver()
        
    }
    
    func gameOver() -> Void {
        
        var gameOver = false
        var titleStr = ""
        
        //guesser won
        if(blankWord.contains("-") == false){
            titleStr = "Guesser Won!"
            gameOver = true
        }
        
        //guesser lost
        if(guessProgressView.progress == 1){
            titleStr = "Guesser Lost."
            gameOver = true
        }
        
        if(gameOver){
            let alert = UIAlertController(title: titleStr, message: "Would you like to play again?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { _ in
                //print("Yes Pressed")
                //go to wordSelection Screen
                self.navigationController?.popViewController(animated: true)
            }))
            alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { _ in
                //print("No Pressed")
                //go to title screen
                self.navigationController?.popToRootViewController(animated: true)
            }))
            self.present(alert, animated: true, completion: nil)
        }
        
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
