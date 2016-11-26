//
//  ViewController.swift
//  ProgressBarFun
//
//  Created by Sivcan Singh on 26/11/16.
//  Copyright © 2016 Sivcan Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressBar: ProgressBarView!
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func sliderMoved(_ sender: Any) {
        progressBar.progress = CGFloat(slider.value)
    }

}

