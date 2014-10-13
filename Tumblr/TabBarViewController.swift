//
//  TabBarViewController.swift
//  Tumblr
//
//  Created by Sara  on 10/9/14.
//  Copyright (c) 2014 Sara Menefee. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {

    @IBOutlet weak var exploreTab: UIImageView!
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
    
        UIView.animateWithDuration(0.9, delay: 0, options: UIViewAnimationOptions.Autoreverse | UIViewAnimationOptions.Repeat, animations: { () -> Void in
            self.exploreTab.transform = CGAffineTransformMakeTranslation(0, -6)
            }, completion: nil)
        
        // Initial view will be Trending
        containerView.addSubview(trendingViewController.view)
    }
    
    // Home Nav Button

    @IBAction func onHomeButton(sender: AnyObject) {
        
        // Discard any existing View Controllers 
        
        searchViewController.view.removeFromSuperview()
        trendingViewController.view.removeFromSuperview()
        profileViewController.view.removeFromSuperview()
        
        containerView.addSubview(homeViewController.view)
        
        homeButton.selected = true
        profileButton.selected = false
        searchButton.selected = false
        trendingButton.selected = false
        
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            self.exploreTab.alpha = 1
        })

        
    }
    
    // Search Nav Button

    @IBAction func onSearchButton(sender: AnyObject) {
        
        // Discard any existing View Controllers

        homeViewController.view.removeFromSuperview()
        trendingViewController.view.removeFromSuperview()
        profileViewController.view.removeFromSuperview()
        
        containerView.addSubview(searchViewController.view)
        
        searchButton.selected = true
        homeButton.selected = false
        trendingButton.selected = false
        profileButton.selected = false
        
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            self.exploreTab.alpha = 0
        })

    }
    
    // Trending Nav Button

    @IBAction func onTrendingButton(sender: AnyObject) {
        
        // Discard any existing View Controllers

        homeViewController.view.removeFromSuperview()
        searchViewController.view.removeFromSuperview()
        profileViewController.view.removeFromSuperview()

        containerView.addSubview(trendingViewController.view)
        
        trendingButton.selected = true
        homeButton.selected = false
        searchButton.selected = false
        profileButton.selected = false
        
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            self.exploreTab.alpha = 1
        })
        
    }
    
    // Profile Nav Button

    @IBAction func onProfileButton(sender: AnyObject) {
        
        // Discard any existing View Controllers

        homeViewController.view.removeFromSuperview()
        searchViewController.view.removeFromSuperview()
        trendingViewController.view.removeFromSuperview()
        
        containerView.addSubview(profileViewController.view)
        
        profileButton.selected = true
        homeButton.selected = false
        searchButton.selected = false
        trendingButton.selected = false
        
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            self.exploreTab.alpha = 1
        })
        
    }
    
    @IBAction func onComposeButton(sender: AnyObject) {
        
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.performSegueWithIdentifier("composeSegue", sender: self)
        })
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        var destinationViewController = segue.destinationViewController as UIViewController
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationViewController.transitioningDelegate = destinationViewController as ComposeViewController
        
    }
    
//    
//    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
//        return 0.9
//    }
//    
//    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
//        isPresenting = true
//        return self
//    }
//    
//    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
//        isPresenting = false
//        return self
//    }
//    

//
//    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
//        
//        var containerView = transitionContext.containerView()
//        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
//        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
//        
//        if (isPresenting) {
//            println("Starting")
//            
//            let vc = fromViewController as ComposeViewController
//
//            vc.textButton.transform = CGAffineTransformMakeTranslation(0, 500)
//            vc.photoButton.transform = CGAffineTransformMakeTranslation(0, 500)
//            vc.quoteButton.transform = CGAffineTransformMakeTranslation(0, 500)
//            vc.linkButton.transform = CGAffineTransformMakeTranslation(0, 500)
//            vc.chatButton.transform = CGAffineTransformMakeTranslation(0, 500)
//            vc.videoButton.transform = CGAffineTransformMakeTranslation(0, 500)
//            vc.nevermindButton.transform = CGAffineTransformMakeTranslation(0, 200)
//            
//            
//            containerView.addSubview(toViewController.view)
//            
//            UIView.animateWithDuration(0.9, animations: { () -> Void in
//                
//                toViewController.view.alpha = 1
//
//                }) { (finished: Bool) -> Void in
//
//                    UIView.animateWithDuration(0.1, animations: { () -> Void in
//                        vc.photoButton.transform = CGAffineTransformMakeTranslation(0, 0)
//                    })
//                    
//                    UIView.animateWithDuration(0.2, animations: { () -> Void in
//                        vc.chatButton.transform = CGAffineTransformMakeTranslation(0, 0)
//                        vc.quoteButton.transform = CGAffineTransformMakeTranslation(0, 0)
//                    })
//                    
//                    UIView.animateWithDuration(0.3, animations: { () -> Void in
//                        vc.textButton.transform = CGAffineTransformMakeTranslation(0, 0)
//                    })
//                    
//                    UIView.animateWithDuration(0.5, animations: { () -> Void in
//                        vc.linkButton.transform = CGAffineTransformMakeTranslation(0, 0)
//                    })
//                    
//                    UIView.animateWithDuration(0.6, animations: { () -> Void in
//                        vc.videoButton.transform = CGAffineTransformMakeTranslation(0, 0)
//                    })
//                    
//                    UIView.animateWithDuration(0.6, animations: { () -> Void in
//                        vc.nevermindButton.transform = CGAffineTransformMakeTranslation(0, 0)
//                    })
//                 
//                    transitionContext.completeTransition(true)
//                    
//            }
//
//            
//            UIView.animateWithDuration(0.1, animations: { () -> Void in
//                
//                toViewController.view.alpha = 1
//                
//                }) { (finished: Bool) -> Void in
//                    transitionContext.completeTransition(true)
//                    fromViewController.view.removeFromSuperview()
//            }
//            
//        } else {
//            
//            println("Finishing")
//            
//            let vc = fromViewController as ComposeViewController
//            
//            UIView.animateWithDuration(0.1, animations: { () -> Void in
//                vc.photoButton.transform = CGAffineTransformMakeTranslation(0, -500)
//            })
//            
//            UIView.animateWithDuration(0.2, animations: { () -> Void in
//                vc.chatButton.transform = CGAffineTransformMakeTranslation(0, -500)
//                vc.quoteButton.transform = CGAffineTransformMakeTranslation(0, -500)
//                
//            })
//            
//            UIView.animateWithDuration(0.3, animations: { () -> Void in
//                vc.textButton.transform = CGAffineTransformMakeTranslation(0, -500)
//            })
//            
//            UIView.animateWithDuration(0.5, animations: { () -> Void in
//                vc.linkButton.transform = CGAffineTransformMakeTranslation(0, -500)
//            })
//            
//            UIView.animateWithDuration(0.6, animations: { () -> Void in
//                vc.videoButton.transform = CGAffineTransformMakeTranslation(0, -500)
//            })
//            
//            UIView.animateWithDuration(0.6, animations: { () -> Void in
//                vc.nevermindButton.transform = CGAffineTransformMakeTranslation(0, 200)
//            })
//            
//            delay(0.5) {
//                UIView.animateWithDuration(0.1, animations: { () -> Void in
//    
//                fromViewController.view.alpha = 0
//                
//                }) { (finished: Bool) -> Void in
//                    transitionContext.completeTransition(true)
//                    fromViewController.view.removeFromSuperview()
//            }
//        }
//        }
//            
//    }
//    
//    func delay(delay:Double, closure:()->()) {
//        dispatch_after(
//            dispatch_time(
//                DISPATCH_TIME_NOW,
//                Int64(delay * Double(NSEC_PER_SEC))
//            ),
//            dispatch_get_main_queue(), closure)
//    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        }
    

}
