//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        heightSlider.value = 0
        weightSlider.value = 0
        CurrentHeight.text = "0m"
        currentWeight.text = "0kg"
        
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var currentWeight: UILabel!
    @IBOutlet weak var CurrentHeight: UILabel!
    @IBAction func HSliderChange(_ sender: UISlider) {
        CurrentHeight.text = "\(String(format: "%.2f",sender.value))m"
    }
    @IBAction func weightSliderChange(_ sender: UISlider) {
        currentWeight.text = "\(String(round(sender.value))) kg"
    }
    
    @IBAction func calculateButton(_ sender: UIButton) {
        var BMI = weightSlider.value/(pow(heightSlider.value,2))
        print (BMI)
    }
}

