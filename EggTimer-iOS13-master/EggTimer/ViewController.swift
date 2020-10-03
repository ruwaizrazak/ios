//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let eggtimes = ["Soft":300,"Medium":420,"Hard":720]

    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var timerLabel: UILabel!
    var secondsRemaining = 60
    var total = 0
    var timer = Timer() //we cant invalidate the Timer directly, so we are using this to invalidate.
    @IBAction func hardness(_ sender: UIButton) {
        timer.invalidate() //uses to reset the timer
        let hardness = sender.currentTitle
        secondsRemaining = eggtimes[hardness!]!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        total = secondsRemaining
        
    }
    @objc func updateTimer(){
        
        if secondsRemaining > 0{
            timerLabel.text = String(secondsRemaining)
            secondsRemaining -= 1
            progressBar.progress = 1.0-(Float(secondsRemaining)/Float(total)) //earlier, when i was trying to divide wholenumbers and then convert them to FLOAT, it was causnig a bug. instead of that, convert everything to float, then solve for it.
        }
        else {
        timerLabel.text = "Done"
        }
    }
    
}
