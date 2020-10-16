//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    var BMI = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
       /* heightSlider.value = 0
        weightSlider.value = 0
        CurrentHeight.text = "0m"
        currentWeight.text = "0kg"
        */
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
        BMI = Double(weightSlider.value/(heightSlider.value*heightSlider.value))
        self.performSegue(withIdentifier: "goToResult", sender: self)
        print(BMI)
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! resultViewController
            destinationVC.BMIValue = String(BMI)
        }
    }
}

