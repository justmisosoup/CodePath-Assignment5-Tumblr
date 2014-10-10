//
//  ComposeViewController.swift
//  Tumblr
//
//  Created by Sara Menefee on 10/9/14.
//  Copyright (c) 2014 Sara Menefee. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBOutlet weak var videoButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var linkButton: UIButton!
    @IBOutlet weak var quoteButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var textButton: UIButton!
    @IBOutlet weak var darkModalView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Annimate in of buttons happens here...

        
    
//
//        UIView.animateWithDuration(0.6, animations: { () -> Void in
//            self.videoButton.transform = CGAffineTransformMakeTranslation(CGFloat(0), CGFloat(160))
//            self.chatButton.transform = CGAffineTransformMakeTranslation(CGFloat(0), CGFloat(160))
//            self.linkButton.transform = CGAffineTransformMakeTranslation(CGFloat(0), CGFloat(160))
//            self.quoteButton.transform = CGAffineTransformMakeTranslation(CGFloat(0), CGFloat(160))
//            self.photoButton.transform = CGAffineTransformMakeTranslation(CGFloat(0), CGFloat(160))
//            self.textButton.transform = CGAffineTransformMakeTranslation(CGFloat(0), CGFloat(160))
//
//        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    @IBAction func onTabBack(sender: AnyObject) {
        
        // Stagger the animate out...there has to be a better way to do this...
        
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            self.photoButton.transform = CGAffineTransformMakeTranslation(0, -500)
        })
        
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.chatButton.transform = CGAffineTransformMakeTranslation(0, -500)
            self.quoteButton.transform = CGAffineTransformMakeTranslation(0, -500)

        })
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.textButton.transform = CGAffineTransformMakeTranslation(0, -500)
        })
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.linkButton.transform = CGAffineTransformMakeTranslation(0, -500)
        })
        
        UIView.animateWithDuration(0.6, animations: { () -> Void in
            self.videoButton.transform = CGAffineTransformMakeTranslation(0, -500)
        })
        
        dismissViewControllerAnimated(true, completion: nil)
        
        
        
    }


}
