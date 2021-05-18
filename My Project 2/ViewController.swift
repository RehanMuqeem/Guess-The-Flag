//
//  ViewController.swift
//  Guess The Flag
//
//  Created by Rehan Muqeem on 12/12/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
   
    var countries = [String]()
    var score = 0
    var correctAnswer = 0 /// it holds correct answer.
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
                
        askQuestion()
    }

    func askQuestion(action: UIAlertAction! = nil) {
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2) ///generates a random no in this range.
        
//when an array is shuffle so contents are shuffled the index(position)of items got changed.
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased()
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) { //from all three buttons we made it. All three button calling the same method. We use different tags for different buttons.
        
        var title : String
        
        if sender.tag == correctAnswer {
            title = "correct"
            score += 1
            
        } else {
            title = "Wrong"
            score -= 1
        }
        
        let ac = UIAlertController(title : title, message : "Your score is \(score)", preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title : "Continue", style: .default, handler : askQuestion)) ///add a button to alert that is 'continue'.
        
        present(ac, animated : true)
   
        }
    
}

