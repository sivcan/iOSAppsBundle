//
//  ViewController.swift
//  MiraclePill
//
//  Created by Sivcan Singh on 24/11/16.
//  Copyright © 2016 Sivcan Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    //When the error says "Does not conform to protocol" then it simply means that you need to implement the functions that are available in the UIPickerViewDataSource (it's like an interface in java..you gotta implement them i.e. they are required.)

    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet weak var stateDisplay: UIButton!
    
    var states = ["Alaska","Las Vegas","Alabama","California","New York"]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        statePicker.isHidden = true
        statePicker.delegate = self
        statePicker.dataSource = self
        stateDisplay.setTitle(states[0], for: UIControlState.normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func stateButton(_ sender: Any) {
        statePicker.isHidden = false
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        stateDisplay.setTitle(states[row], for: UIControlState.normal)
        statePicker.isHidden = true
    }

}

