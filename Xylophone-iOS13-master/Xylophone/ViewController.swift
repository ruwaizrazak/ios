//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
var player: AVAudioPlayer?
let seconds = 0.2
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func Button(_ sender: UIButton) {
        sender.alpha=0.5
        playSound(tone  :  sender.currentTitle!)
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            // Put your code which should be executed with a delay here
            sender.alpha=1
        }
        
    }
    
    func playSound( tone: String) {
        guard let url = Bundle.main.url(forResource: tone, withExtension: "wav") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            guard let player = player else { return }
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    

}

