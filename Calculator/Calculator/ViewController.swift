//
//  ViewController.swift
//  Calculator
//
//  Created by Joanne Koong on 6/19/15.
//  Copyright (c) 2015 joanne. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTypingNumber: Bool = false
    var Brain = CalculatorBrain()
    var decimal = false
    
    
    @IBOutlet weak var history: UILabel!


    
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if digit == "." && decimal == true {
            return
        }
        else if digit == "." && decimal == false {
            decimal = true
        }

        if userIsInTheMiddleOfTypingNumber {
            display.text = display.text! + digit
        } else {
            display.text = digit
            userIsInTheMiddleOfTypingNumber = true
        }
    }
    
    @IBAction func operate(sender: UIButton) {
        
        if userIsInTheMiddleOfTypingNumber {
            enter()
        }
        
        if let operation = sender.currentTitle {

            if let result = Brain.performOperation(operation) {
                displayValue = result
            } else {
                displayValue = 0
            }
            history.text = history.text! + sender.currentTitle! + " "
        
        }
        
    }
    @IBAction func clear() {
        Brain = CalculatorBrain()
        displayValue = nil
        history.text = "History: "
        
    }
    

    @IBAction func enter() {
        userIsInTheMiddleOfTypingNumber = false
        decimal = false
        if let result = Brain.pushOperand(displayValue!) {
            displayValue = result
            history.text = history.text! + result.description + ", "
        } else {
            displayValue = 0
        }
        
    }
    
    var displayValue: Double? {
        get {
            if let displayText = display.text {
                if let displayNumber = NSNumberFormatter().numberFromString(display.text!) {
                    return displayNumber.doubleValue
                }
            }
            return nil

        }
        
        set {
            if (newValue != nil) {
                display.text = "\(newValue)"
            }
            else {
                display.text = "0"
            }
            userIsInTheMiddleOfTypingNumber = false
        }
    }
   
}

