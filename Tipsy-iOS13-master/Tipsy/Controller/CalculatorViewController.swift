//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

   
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    var tip = 0.10
    var split = 0
    var total = 0.0
   
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        tip = buttonTitleAsANumber / 100
        
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        split = Int(sender.value)
        splitNumberLabel.text = String(sender.value)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        total = Double(billTextField.text!)!
        let totalTip = total * tip
        total = (total+totalTip)/Double(split)
        print(total)
        self.performSegue(withIdentifier: "toResultCalculator", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toResultCalculator") {
            let vc = segue.destination as! ResultsViewController
            vc.total = String(format:"%.2f",total)
            vc.split = String(split)
            vc.tip = "\(String(tip*100))%"
        }
    }
    
}

