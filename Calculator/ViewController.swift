//
//  ViewController.swift
//  Calculator
//
//  Created by kovil savaj on 28/10/22.
//

import UIKit

enum Operation:String {
    case Add = "+"
    case Subtract = "-"
    case Divide = "/"
    case Multiply = "*"
    case Percentage = "%"
    case NULL = "Null"
}

class ViewController: UIViewController {
    
    @IBOutlet weak var screenlabel: UILabel!
    
    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var currentOperation:Operation = .NULL
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        screenlabel.text="0"
    }
    
    @IBAction func numberPressed(_ sender: UIButton) {
    //    if runningNumber.count <= 9 {
            runningNumber += "\(sender.tag)"
            screenlabel.text = runningNumber
    //    }
    }
    
    @IBAction func dividePressed(_ sender: RoundButton) {
        operation(operation: .Divide)
    }
    
    @IBAction func multiplyPressed(_ sender: RoundButton) {
        operation(operation: .Multiply)
    }
    
    @IBAction func subtractPressed(_ sender: RoundButton) {
        operation(operation: .Subtract)
    }
    
    
    @IBAction func addPressed(_ sender: RoundButton) {
        operation(operation: .Add)
    }
    
    @IBAction func allClearPressed(_ sender: RoundButton) {
        runningNumber = ""
        leftValue = ""
        rightValue = ""
        result = ""
        currentOperation = .NULL
        screenlabel.text = "0"
    }
    
    @IBAction func dotPressed(_ sender: RoundButton) {
            runningNumber += "."
            screenlabel.text = runningNumber
        
    }
    
    @IBAction func equalPressed(_ sender: RoundButton) {
       operation(operation: currentOperation)
    }
    
    @IBAction func percentagePressed(_ sender: RoundButton) {
        operation(operation: .Percentage)
    }
    
    @IBAction func signChange(_ sender: RoundButton) {
    }
    
    func operation(operation: Operation){
        if currentOperation != .NULL{
            if runningNumber != "" {
                rightValue = runningNumber
                runningNumber = ""
                
                if currentOperation == .Add {
                    result = "\(Double(leftValue)! + Double(rightValue)!)"
                }else if currentOperation == .Subtract{
                    result = "\(Double(leftValue)! - Double(rightValue)!)"
                }else if currentOperation == .Multiply{
                    result = "\(Double(leftValue)! * Double(rightValue)!)"
                }else if currentOperation == .Divide{
                    result = "\(Double(leftValue)! / Double(rightValue)!)"
                }else if currentOperation == .Percentage{
                    result = "\((Double(leftValue)! / Double(rightValue)!) * 100) "
                }
                leftValue = result
                if currentOperation == .Percentage {
                    
                }else if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0){
                    result = "\(Int(Double(result)!))"
                }
                screenlabel.text = result
            }
            currentOperation = operation
            
        }else {
            leftValue = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
    
}

