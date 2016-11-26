//
//  PartyDrinks.swift
//  PartyRockMansion
//
//  Created by Sivcan Singh on 25/11/16.
//  Copyright © 2016 Sivcan Singh. All rights reserved.
//

import Foundation

class PartyDrinks {
    private var _imageURL : String!
    private var _videoURL : String!
    private var _videoTitle : String!
    
    var imageURL : String {  //This is obv, because we don't want anyone else to access our values thus we make the variables private.
        return _imageURL
    }
    
    var videoURL : String {
        return _videoURL
    }
    
    var videoTitle : String {
        return _videoTitle
    }

    init(imageURL : String, videoURL : String, videoTitle : String) {
        _imageURL = imageURL
        _videoURL = videoURL
        _videoTitle = videoTitle
    }
}
