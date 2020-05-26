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
    var wordText: String?
        
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
        
        //dictionaryCall()
        
        wordText = wordTextField.text?.uppercased()
                
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
    
//    func dictionaryCall(){
//        let appId = "5886c1ac"
//        let appKey = "6398510576687de8b0a444904d422f20"
//        let language = "en-us"
//        let word = "run"
//        let fields = "definitions"
//        let strictMatch = "false"
//        let word_id = word.lowercased()
//        //let url = URL(string: "https://od-api.oxforddictionaries.com:443/api/v2/entries/\(language)/\(word_id)?fields=\(fields)&strictMatch=\(strictMatch)")!
//
//        let url = URL(string: "https://od-api.oxforddictionaries.com:443/api/v2/entries/\(language)/\(word_id)?fields=\(fields)")!
//        var request = URLRequest(url: url)
//        request.addValue("application/json", forHTTPHeaderField: "Accept")
//
//        //header-values
//        request.addValue(appId, forHTTPHeaderField: "app_id")
//        request.addValue(appKey, forHTTPHeaderField: "app_key")
//
//        let session = URLSession.shared
//        _ = session.dataTask(with: request, completionHandler: { data, response, error in
//            if let response = response,
//                let data = data,
//                let jsonData = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) {
//                print(response)
//                print(jsonData)
//            } else {
//                print(error)
//                print(NSString.init(data: data!, encoding: String.Encoding.utf8.rawValue))
//            }
//        }).resume()
//    }
    
//    func fetchJSON(completion: @escaping (Word)-> ()){
//
//        let appId = "5886c1ac"
//        let appKey = "6398510576687de8b0a444904d422f20"
//        let language = "en-us"
//        let word = wordText!
//        let fields = "definitions"
//        //let strictMatch = "false"
//        let word_id = word.lowercased()
//
//        let urlString = "https://od-api.oxforddictionaries.com:443/api/v2/entries/\(language)/\(word_id)?fields=\(fields)"
//
//        guard let url = URL(string: urlString) else { return }
//
//        var request = URLRequest(url: url)
//        //What is URLRequest? What is the difference between URLRequest and URL
//        request.addValue("application/json", forHTTPHeaderField: "Accept")
//
//        //header-values
//        request.addValue(appId, forHTTPHeaderField: "app_id")
//        request.addValue(appKey, forHTTPHeaderField: "app_key")
//
//        URLSession.shared.dataTask(with: request) { (data, response, err) in
//
//            if let response = response { //testq?
//                print(response)
//            }
//
//            if let jsonData = data{
//                print(jsonData)
//                do{
//                    let decoder = JSONDecoder()
//                    let parsed = try decoder.decode((self.wordJSON?)!, from: jsonData)
//                    completion(parsed)
//                    let json = try JSONSerialization.jsonObject(with: jsonData, options: [])
//                    //print(jsonData)
//                    print(parsed)
//                } catch{
//                    print(error)
//                }
//            } else {
//                print("something went wrong")
//            }
//
//        }.resume()
//    }
    
}
