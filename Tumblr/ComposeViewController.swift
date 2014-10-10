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
        
//        darkModalView.backgroundColor = UIColor(red: 51/255, green: 66/255, blue: 86/255, alpha: 90/100)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func onTabBack(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }


}
