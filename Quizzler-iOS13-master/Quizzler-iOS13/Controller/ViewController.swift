//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreText: UILabel!
    
    var quizBrain = QuizBrain()
    
    
    
    func updateUI() {
        QuestionLabel.text = quizBrain.getQuestionText()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress( )
        scoreText.text = "Score : \(quizBrain.getScore())"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        
        //the userAnswer is the one that we mentioned above. check quizbrain.swift for more details
        if  quizBrain.checkAnswer(sender.currentTitle!) == true{
            sender.backgroundColor = UIColor.green
        }
        else{
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion()
        
        
        let secondsToDelay = 0.2
        DispatchQueue.main.asyncAfter(deadline: .now() + secondsToDelay) {
            // Put any code you want to be delayed here
            self.updateUI()
        }
        
    }
    
}

