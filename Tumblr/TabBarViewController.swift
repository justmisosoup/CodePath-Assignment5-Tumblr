//
//  TabBarViewController.swift
//  Tumblr
//
//  Created by Sara  on 10/9/14.
//  Copyright (c) 2014 Sara Menefee. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var trendingButton: UIButton!
    
    var homeViewController : UIViewController!
    var searchViewController : UIViewController!
    var trendingViewController : UIViewController!
    var profileViewController : UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as UIViewController
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController") as UIViewController
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController") as UIViewController
        profileViewController = storyboard.instantiateViewControllerWithIdentifier("ProfileViewController") as UIViewController
    
        // Initial view will be Trending
        
        trendingViewController.view.frame = containerView.frame
        containerView.addSubview(trendingViewController.view)
    }
    
    // Home Nav Button

    @IBAction func onHomeButton(sender: AnyObject) {

        homeViewController.view.frame = containerView.frame
        self.addChildViewController(homeViewController)
        containerView.addSubview(homeViewController.view)
        homeViewController.didMoveToParentViewController(self)
        homeButton.selected = true
        profileButton.selected = false
        searchButton.selected = false
        trendingButton.selected = false
    }
    
    // Search Nav Button

    @IBAction func onSearchButton(sender: AnyObject) {

        searchViewController.view.frame = containerView.frame
        containerView.addSubview(searchViewController.view)
        self.addChildViewController(searchViewController)
        searchViewController.didMoveToParentViewController(self)
        searchButton.selected = true
        homeButton.selected = false
        trendingButton.selected = false
        profileButton.selected = false
    }
    
    // Trending Nav Button

    @IBAction func onTrendingButton(sender: AnyObject) {

        trendingViewController.view.frame = containerView.frame
        self.addChildViewController(trendingViewController)
        containerView.addSubview(trendingViewController.view)
        trendingViewController.didMoveToParentViewController(self)
        trendingButton.selected = true
        homeButton.selected = false
        searchButton.selected = false
        profileButton.selected = false
    }
    
    // Profile Nav Button

    @IBAction func onProfileButton(sender: AnyObject) {

        profileViewController.view.frame = containerView.frame
        self.addChildViewController(profileViewController)
        containerView.addSubview(profileViewController.view)
        profileViewController.didMoveToParentViewController(self)
        profileButton.selected = true
        homeButton.selected = false
        searchButton.selected = false
        trendingButton.selected = false
    }
    
    @IBAction func onComposeButton(sender: AnyObject) {
        performSegueWithIdentifier("composeSegue", sender: self)
        
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        }
    

}
