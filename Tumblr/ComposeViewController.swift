//
//  ComposeViewController.swift
//  Tumblr
//
//  Created by Sara Menefee on 10/9/14.
//  Copyright (c) 2014 Sara Menefee. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {

    @IBOutlet weak var videoButton : UIButton!
    @IBOutlet weak var chatButton  : UIButton!
    @IBOutlet weak var linkButton: UIButton!
    @IBOutlet weak var quoteButton : UIButton!
    @IBOutlet weak var photoButton : UIButton!
    @IBOutlet weak var textButton : UIButton!
    @IBOutlet weak var darkModalView : UIView!
    @IBOutlet weak var nevermindButton : UIButton!
    
    var isPresenting : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animateIcons(600)
        
    }

    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            
            // Introduce Buttons
            
            println("Starting")
            animateIcons(0)
            
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                
                toViewController.view.alpha = 1
                
                }) { (finished: Bool) -> Void in
                    
                transitionContext.completeTransition(true)
                    
            }
            
            
        } else {
            
            // Exit Buttons
            
            println("Finishing")
            animateIcons(-500)
            
            delay(0.5) {
                UIView.animateWithDuration(0.1, animations: { () -> Void in
                    
                    fromViewController.view.alpha = 0
                    
                    }) { (finished: Bool) -> Void in
                        transitionContext.completeTransition(true)
                        fromViewController.view.removeFromSuperview()
                }
            }
            
            UIView.animateWithDuration(0.6, animations: { () -> Void in
                self.nevermindButton.transform = CGAffineTransformMakeTranslation(0, 200)
            })
        }
        
    }
    
    // Create a function to call above for position of buttons

    func animateIcons(position : CGFloat) {
        
        println("Finishing")
        
        // Photo Button
        
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            self.photoButton.transform = CGAffineTransformMakeTranslation(0, position)
        })
        
        // Chat & Quote Button
        
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.chatButton.transform = CGAffineTransformMakeTranslation(0, position)
            self.quoteButton.transform = CGAffineTransformMakeTranslation(0, position)
        })
        
        // Text Button
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.textButton.transform = CGAffineTransformMakeTranslation(0, position)
        })
        
        // Link Button
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.linkButton.transform = CGAffineTransformMakeTranslation(0, position)
        })
        
        // Video Button
        
        UIView.animateWithDuration(0.6, animations: { () -> Void in
            self.videoButton.transform = CGAffineTransformMakeTranslation(0, position)
        })

        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    @IBAction func onTabBack(sender: AnyObject) {
                
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }


}
