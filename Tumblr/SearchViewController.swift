//
//  SearchViewController.swift
//  Tumblr
//
//  Created by Sara  on 10/9/14.
//  Copyright (c) 2014 Sara Menefee. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var feedViewImg: UIImageView!
    @IBOutlet weak var loader1Img: UIImageView!
    @IBOutlet weak var loader2Img: UIImageView!
    @IBOutlet weak var loader3Img: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedViewImg.alpha = 0
        loader2Img.alpha = 0
        loader3Img.alpha = 0
        
        UIView.animateWithDuration(2, animations: { () -> Void in
            
            self.loader1Img.transform = CGAffineTransformMakeTranslation(0, 12)
            
            }) { (finshed: Bool) -> Void in
                
                self.feedViewImg.alpha = 1
                self.loader1Img.alpha = 0
        }
        
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}
