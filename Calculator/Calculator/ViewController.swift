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
            if operation == "π" {
                displayValue = Double(M_PI)
                enter()
            }
            else if operation == "C" {
                Brain.cleanOperand()
                displayValue = 0
            }
            else {
                if let result = Brain.performOperation(operation) {
                    displayValue = result
                } else {
                    displayValue = 0
                }
            }
        }
    }
    
    
    @IBAction func enter() {
        userIsInTheMiddleOfTypingNumber = false
        decimal = false
        if let result = Brain.pushOperand(displayValue) {
            displayValue = result
        } else {
            displayValue = 0
        }
        
    }
    
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        
        set {
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingNumber = false
        }
    }
   
}

