//
//  PartyCell.swift
//  PartyRockMansion
//
//  Created by Sivcan Singh on 25/11/16.
//  Copyright © 2016 Sivcan Singh. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {

    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var videoPreviewImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateUI(partyDrinks : PartyDrinks) {
        videoTitle.text = partyDrinks.videoTitle
        //TODO : Set image from URL
    }

}
