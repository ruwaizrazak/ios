//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        diceImageView1.image = #imageLiteral(resourceName: "DiceSix") //to get this image, we need to use image literal
        diceImageView2.image = #imageLiteral(resourceName: "DiceTwo")
    }
    let imageArray  : [UIImage] = [#imageLiteral(resourceName: "DiceOne"),#imageLiteral(resourceName: "DiceTwo"),#imageLiteral(resourceName: "DiceThree"),#imageLiteral(resourceName: "DiceFour"),#imageLiteral(resourceName: "DiceFive"),#imageLiteral(resourceName: "DiceSix")]
    

    @IBAction func Roll(_ sender: UIButton) {
        diceImageView2.image = imageArray.randomElement()
        diceImageView1.image = imageArray.randomElement()
        //randomElement is a new built in method which is recoemmended for this type of use, instead of defining a random value within a defined set.
    }
    
}

