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
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        println("digit = \(digit)")
        if userIsInTheMiddleOfTypingNumber {
            display.text = display.text! + digit
        } else {
            display.text = digit
            userIsInTheMiddleOfTypingNumber = true
        }
        
    }
    
    var operandStack = Array<Double>()
    
    @IBAction func enter() {
        userIsInTheMiddleOfTypingNumber = false
        operandStack.append(displayValue)
        println("operandStack: \(operandStack)")
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
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if userIsInTheMiddleOfTypingNumber {
            enter()
        }
        switch operation {
            case "×": performOperation{ $0 * $1 }
            case "÷": performOperation{ $1 / $0 }
            case "+": performOperation{ $0 + $1 }
            case "−": performOperation{ $1 - $0 }
            case "√": performOperation{ sqrt($0) }
//          case "−": performOperation({ (op1, op2) in op1 - op2 })
            default: break
        }
    }
    
    func performOperation(operation: (Double, Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }
    
    func performOperation(operation: Double -> Double) {
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter()
        }
    }
}

