//
//  ViewController.swift
//  calculator
//
//  Created by maci on 9/21/17.
//  Copyright © 2017 maci. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var display: UILabel! // wenn ? am schluss muss das optional immer "dereferenziert" werden
    
    private var userIsCurrentlyTyping = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction private func ButtonTouched(_ sender: UIButton) {
        let buttonPressed = sender.currentTitle!
        
        if userIsCurrentlyTyping {
            let currentDisplayValues = display.text!
            display.text = currentDisplayValues + buttonPressed
        } else {
            display.text = buttonPressed
        }
        userIsCurrentlyTyping = true
        // print("button: \(sender.currentTitle!) pressed")
    }
    
    private var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    private var brain = CalcBrain()
    
    @IBAction private func operationTouched(_ sender: UIButton) {
        if userIsCurrentlyTyping {
            brain.setOperand(operand: displayValue)
            userIsCurrentlyTyping = false
        }
        if let mathSymbol = sender.currentTitle{ // prüft optional
            brain.performOperation(symbol: mathSymbol)
        }
        displayValue = brain.result
    }
}
