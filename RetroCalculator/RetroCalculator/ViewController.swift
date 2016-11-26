//
//  ViewController.swift
//  RetroCalculator
//
//  Created by Sivcan Singh on 25/11/16.
//  Copyright © 2016 Sivcan Singh. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!
    var buttonSound : AVAudioPlayer!
    var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    var result = ""
    
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
    }
    
    var currentOperation = Operation.Empty
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "btn", ofType: "wav")
        let soundURL = URL(fileURLWithPath: path!)
        
        do {
            
            try buttonSound = AVAudioPlayer(contentsOf: soundURL)
            buttonSound.prepareToPlay()
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        outputLabel.text = "0"
    }
    
    @IBAction func numberPressed(sender: UIButton) {
        playSound()
        runningNumber += "\(sender.tag)"
        outputLabel.text = runningNumber
    }
    
    @IBAction func onOperationPressed(sender: UIButton) {
        if(sender.tag == 10) {
            processOperation(operation: .Divide)
        } else if (sender.tag == 11) {
            processOperation(operation: .Multiply)
        } else if(sender.tag == 12) {
            processOperation(operation: .Subtract)
        } else if(sender.tag == 13) {
            processOperation(operation: .Add)
        }
    }
    
    @IBAction func onEqualPressed(_ sender: Any) {
        processOperation(operation: currentOperation)
    }
    
    func playSound() {
        if buttonSound.isPlaying {
            buttonSound.stop()
        } else {
            buttonSound.play()
        }
    }
    
    @IBAction func clearButton(_ sender: Any) {
        outputLabel.text = ""
        result = ""
        rightValStr = ""
        leftValStr = ""
        currentOperation = Operation.Empty
        playSound()
    }
    
    func processOperation(operation: Operation) {
        playSound()
        if currentOperation != Operation.Empty {
                                        //A user selected an operator, but then selected another operator without first entering a number
            if runningNumber != "" {
                rightValStr = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Multiply {
                    result = "\(Double(leftValStr)! * Double(rightValStr)!)"
                } else if currentOperation == Operation.Divide {
                    result = "\(Double(leftValStr)! / Double(rightValStr)!)"
                } else if currentOperation == Operation.Subtract {
                    result = "\(Double(leftValStr)! - Double(rightValStr)!)"
                } else if currentOperation == Operation.Add {
                    result = "\(Double(leftValStr)! + Double(rightValStr)!)"
                }
                leftValStr = result
                outputLabel.text = result
            }
            
            currentOperation = operation
        } else {
            //This is the first time an operator has been pressed 
            leftValStr = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
}

