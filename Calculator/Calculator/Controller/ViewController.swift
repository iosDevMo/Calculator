//
//  ViewController.swift
//  Calculator
//
//  Created by mohamdan on 18/03/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLbl: UILabel!
    private var isFinishedTypingNumber : Bool = true
    private var displayValue : Double {
        get {
            guard let number = Double(displayLbl.text!) else {
                fatalError("cannot convert diplay label text to a Double")
            }
            return number
        }
        set {
            displayLbl.text = String(newValue)
        }
    }
    private var calculatorLogic = CalculatorLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func calcBtnPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        
    }
    
    @IBAction func numBtnPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLbl.text = numValue
                isFinishedTypingNumber = false
            } else {
                if numValue == "." {
                    if let currentDisplayValue = Double(displayLbl.text!) {
                        let isInt = currentDisplayValue == floor(currentDisplayValue)
                        if !isInt {
                            return
                        }
                    }
                }
                displayLbl.text = displayLbl.text! + numValue
            }
        }
    }
}

