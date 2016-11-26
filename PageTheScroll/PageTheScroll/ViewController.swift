//
//  ViewController.swift
//  PageTheScroll
//
//  Created by Sivcan Singh on 24/11/16.
//  Copyright © 2016 Sivcan Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate{

    var images = [UIImageView]()
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet var panGesture: UIScreenEdgePanGestureRecognizer!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        var contentWidth : CGFloat = 0.0
        
        let scrollWidth = scrollView.frame.size.width
        for x in 0...2 {
            let image = UIImage(named: "icon\(x).png")
            let imageView = UIImageView(image: image)
            images.append(imageView)
            
            var newX : CGFloat = 0.0
            newX = (scrollWidth / 2) + scrollWidth * CGFloat(x)
            contentWidth +=  newX
            scrollView.addSubview(imageView)
            
            imageView.frame = CGRect(x: newX - 75, y: (scrollView.frame.size.height / 2) - 75, width: 150, height: 150)
        }
        scrollView.clipsToBounds = false
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.height)
        
    }
    
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
 

}

