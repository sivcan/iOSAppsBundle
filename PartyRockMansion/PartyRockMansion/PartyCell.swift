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
        
        let url = URL(string: partyDrinks.imageURL)!
        DispatchQueue.global().async {  //async is background thread
            do {
                let data = try Data(contentsOf: url)
                DispatchQueue.global().sync {  //main user level thread
                    self.videoPreviewImage.image = UIImage(data: data)
                }
            } catch let err as NSError {
                print(err.debugDescription)
            }
        }
        
    }

}
