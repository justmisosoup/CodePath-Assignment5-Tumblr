//
//  TabBarViewController.swift
//  Tumblr
//
//  Created by Sara  on 10/9/14.
//  Copyright (c) 2014 Sara Menefee. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var trendingButton: UIButton!
    
    var homeViewController : UIViewController!
    var searchViewController : UIViewController!
    var trendingViewController : UIViewController!
    var profileViewController : UIViewController!
    var isPresenting : Bool = true

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
        
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.performSegueWithIdentifier("composeSegue", sender: self)
        })
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        // When preparing for the segue, make sure you define the destinationViewController as PhotoViewController. Set up the custom modal presentation style as well as transition delegation and of course calling the weddingImg that you already passed through the gestureRec into the destination View Controller.
        
        var destinationViewController = segue.destinationViewController as ComposeViewController
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationViewController.transitioningDelegate = self
        
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.2
    }
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            
            UIView.animateWithDuration(0.1, animations: { () -> Void in
                
                toViewController.view.alpha = 1
                
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
            }
            
        } else {
            
            delay(0.5) {
                UIView.animateWithDuration(0.1, animations: { () -> Void in
    
                fromViewController.view.alpha = 0
                
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
            }
        }
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
