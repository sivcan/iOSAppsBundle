//
//  VideoVC.swift
//  PartyRockMansion
//
//  Created by Sivcan Singh on 25/11/16.
//  Copyright © 2016 Sivcan Singh. All rights reserved.
//

import UIKit

class VideoVC: UIViewController {

    @IBOutlet weak var webview : UIWebView!
    @IBOutlet weak var titleLabel: UILabel!
    
    private var _partyDrink : PartyDrinks!
    
    var partyDrink : PartyDrinks {
        get {
            return _partyDrink
        } set {
            _partyDrink = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = partyDrink.videoTitle
        webview.loadHTMLString(partyDrink.videoURL, baseURL: nil)
        
    }

}
