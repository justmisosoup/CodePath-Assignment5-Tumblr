//
//  SearchViewController.swift
//  Tumblr
//
//  Created by Sara  on 10/9/14.
//  Copyright (c) 2014 Sara Menefee. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var loadingImg: UIImageView!
    @IBOutlet weak var feedViewImg: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedViewImg.alpha = 0
        var images = UIImage.animatedImageNamed("loading-", duration: 0.9)
        loadingImg.image = images
        
        }
    
    override func viewDidAppear(animated: Bool) {
        delay(1) {
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.feedViewImg.alpha = 1
            })
        }
    }

    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}
