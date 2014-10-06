//
//  NewsFeedViewController.swift
//  facebook
//
//  Created by Jayne Vidheecharoen on 9/15/14.
//  Copyright (c) 2014 Jayne Vidheecharoen. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {

    var isPresenting: Bool = true
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var wedding1View: UIImageView!
    @IBOutlet weak var wedding2View: UIImageView!
    @IBOutlet weak var wedding3View: UIImageView!
    @IBOutlet weak var wedding4View: UIImageView!
    @IBOutlet weak var wedding5View: UIImageView!
    
    var imageViewToSegue : UIImageView!
    
    var startPosition: CGPoint!
    var endPosition: CGPoint!
    
    var startEndSize: CGSize!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = imageView.frame.size
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        var destinationViewController = segue.destinationViewController as PhotoViewController
        destinationViewController.image = self.imageViewToSegue.image
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationViewController.transitioningDelegate = self
        
    }
    
    // Presenting stuff
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
    // transition stuff
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.5
    }
    
    // actual animation happens in here
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            
            startPosition = imageViewToSegue.center
            
            var window = UIApplication.sharedApplication().keyWindow
            var frame = window.convertRect(self.imageViewToSegue.frame, fromView: scrollView)
            var copyImageView = UIImageView(frame: frame)
            
            copyImageView.image = imageViewToSegue.image
            copyImageView.frame.size = imageViewToSegue.frame.size
            
            window.addSubview(copyImageView)
            
            copyImageView.contentMode = UIViewContentMode.ScaleAspectFill
            copyImageView.clipsToBounds = true
            
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0

            // animate the copy
            
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                
                copyImageView.frame.size.width = 320
                
                var ratio = (self.imageViewToSegue.image!.size.height) / (self.imageViewToSegue.image!.size.width)
                
                copyImageView.frame.size.height = 320 * ratio

                copyImageView.center.x = 160
                copyImageView.center.y = 290
                
                self.startEndSize = copyImageView.frame.size
                self.endPosition = copyImageView.center

                
                toViewController.view.alpha = 1
                
                }){ (finished: Bool) -> Void in
                    copyImageView.removeFromSuperview()
                    transitionContext.completeTransition(true)
            }
        } else {
            
            // add copy
            var window = UIApplication.sharedApplication().keyWindow
            var frame = window.convertRect(self.imageViewToSegue.frame, fromView: scrollView)
            var copyImageView = UIImageView(frame: frame)
            
            copyImageView.image = imageViewToSegue.image
            copyImageView.frame.size = startEndSize
            copyImageView.center = endPosition

            window.addSubview(copyImageView)
            
            copyImageView.contentMode = UIViewContentMode.ScaleAspectFill
            copyImageView.clipsToBounds = true
            
            
            // animate
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                fromViewController.view.alpha = 0
                

                
                copyImageView.frame.size.width = self.imageViewToSegue.frame.width
                copyImageView.frame.size.height = self.imageViewToSegue.frame.height
                
                
                copyImageView.center = CGPoint(x: self.startPosition.x , y: (self.startPosition.y + 109))
                
                
                
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    copyImageView.removeFromSuperview()

                    fromViewController.view.removeFromSuperview()
            }
        }
    } 


    @IBAction func onTap(gestureRecognizer: UITapGestureRecognizer) {
        imageViewToSegue = gestureRecognizer.view as UIImageView
        
        println(imageViewToSegue.center)
        
        performSegueWithIdentifier("photoSegue", sender: self)
        
        
  

        
    }

}
