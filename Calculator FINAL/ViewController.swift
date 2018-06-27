//
//  ViewController.swift
//  Calculator FINAL
//
//  Created by Peter Gustafson on 5/31/18.
//  Copyright © 2018 Peter Gustafson. All rights reserved.
//

import UIKit

//Enumeration for all Operation/Operator Buttons
//An enumeration defines a common type for a group of related values and enables you to work with those values in a type-safe way within your code.

enum Operation:String {
    case Add = "+"
    case Subtract = "-"
    case Divide = "/"
    case Multiply = "*"
    case NULL = "Null"
}

class ViewController: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!
    
    //Variables to keep track of the numbers that are pressed
    //Running Number is number currently being pressed
    var runningNumber = ""
    //To keep track of the left value pressed before operand
    var leftValue = ""
    //To keep track of the right value pressed after operand
    var rightValue = ""
    //To keep track and display result
    var result = ""
    var currentOperation:Operation = .NULL
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Setting Result Label to 0 when app loads
        outputLabel.text = "0"
    }
    
    @IBAction func numberPressed(_ sender: UIButton) {
        if runningNumber.count <= 10 {
            runningNumber += "\(sender.tag)"
            outputLabel.text = runningNumber
        }
    }
    
    @IBAction func allClearPressed(_ sender: UIButton) {
        runningNumber = ""
        leftValue = ""
        rightValue = ""
        result =  ""
        currentOperation = .NULL
        outputLabel.text = "0"
    }
    
    @IBAction func positiveNegativeButtonPressed(_ sender: UIButton) {
        runningNumber += "-"
    }
    
    @IBAction func dotPressed(_ sender: UIButton) {
        if runningNumber.count <= 9 {
            runningNumber += "."
            outputLabel.text = runningNumber
        }
    }
    
    @IBAction func equalPressed(_ sender: UIButton) {
        operation(operation: currentOperation)
    }
    
    @IBAction func addPressed(_ sender: UIButton) {
        operation(operation: .Add)
    }
    
    @IBAction func subtractPressed(_ sender: UIButton) {
        operation(operation: .Subtract)
    }
    
    @IBAction func multoplyPressed(_ sender: UIButton) {
        operation(operation: .Multiply)
    }
    
    @IBAction func dividePressed(_ sender: UIButton) {
        operation(operation: .Divide)
    }
    
    //Function to Execuite Operations / Passing in Enumeration Declared Earlier
    func operation(operation: Operation) {
        //Validating that an operand button has been pressed
        if currentOperation != .NULL {
            
            if runningNumber != "" {
                rightValue = runningNumber
                runningNumber = ""
                
                //If/Else Statements to check what operator button is pressed and based on that set the result variable equal to that math problem / Passing in Enumeration values declared earlier
                if currentOperation == .Add {
                    result = "\(Double(leftValue)! + Double(rightValue)!)"
                //Check if our result if divisible by 1. If result is divisible by 1 then show Result as an Integer instead of a Double
                    if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0) {
                        result = "\(Int(Double(result)!))"
                    }
                }
                else if currentOperation == .Subtract {
                    result = "\(Double(leftValue)! - Double(rightValue)!)"
                //Check if our result if divisible by 1. If result is divisible by 1 then show Result as an Integer instead of a Double
                    if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0) {
                        result = "\(Int(Double(result)!))"
                    }
                }
                else if currentOperation == .Multiply {
                    result = "\(Double(leftValue)! * Double(rightValue)!)"
                //Check if our result if divisible by 1. If result is divisible by 1 then show Result as an Integer instead of a Double
                    if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0) {
                        result = "\(Int(Double(result)!))"
                    }
                }
                else if currentOperation == .Divide {
                    if rightValue == "0" {
                        result = "Not a number"
                    }
                    else {
                        result = "\(Double(leftValue)! / Double(rightValue)!)"
                //Check if our result if divisible by 1. If result is divisible by 1 then show Result as an Integer instead of a Double
                        if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0) {
                            result = "\(Int(Double(result)!))"
                        }
                    }
                }
             
                //If we need to do more calculations in the future it will assign result as left value for the next operation
                leftValue = result
                //Set output label on UI equal to the result of the function/operand
                outputLabel.text = result
        }
                currentOperation = operation
        
        }
            //If left value is blank/null then assign what user inputs to left value and assign current operation to user input
        else {
            leftValue = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
