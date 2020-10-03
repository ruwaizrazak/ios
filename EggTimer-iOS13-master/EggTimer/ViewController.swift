//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let eggtimes = ["Soft":5,"Medium":7,"Hard":9]
    var player: AVAudioPlayer?
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            guard let player = player else { return }
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var timerLabel: UILabel!
    var secondsRemaining = 60
    var total = 0
    var timer = Timer() //we cant invalidate the Timer directly, so we are using this to invalidate.
    @IBAction func hardness(_ sender: UIButton) {
        timer.invalidate() //uses to reset the timer
        progressBar.progress = 0.0
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
        playSound()
        }
    }
    
}
