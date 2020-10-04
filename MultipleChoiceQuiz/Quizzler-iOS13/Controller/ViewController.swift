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
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreText: UILabel!
    
    var quizBrain = QuizBrain()
    
    
    
    func updateUI() {
        option1.setTitle(quizBrain.getOption(0), for: .normal)
        option2.setTitle(quizBrain.getOption(1), for: .normal)
        option3.setTitle(quizBrain.getOption(2), for: .normal)
        QuestionLabel.text = quizBrain.getQuestionText()
        option1.backgroundColor = UIColor.clear
        option2.backgroundColor = UIColor.clear
        option3.backgroundColor = UIColor.clear
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

