//
//  PhotoViewController.swift
//  facebook
//
//  Created by Jayne Vidheecharoen on 10/2/14.
//  Copyright (c) 2014 Jayne Vidheecharoen. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {
    var image: UIImage!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: 320, height: 580)

        imageView.image = image
        imageView.hidden = true
        
    }
    
    override func viewDidAppear(animated: Bool) {
        imageView.hidden = false
    }
    
    
    @IBAction func onDoneButton(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        // This method is called as the user scrolls
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView!) {
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView!,
        willDecelerate decelerate: Bool) {
            
        var offset = Float(scrollView.contentOffset.y)
    
            if offset < -100 {
                imageView.hidden = true
                dismissViewControllerAnimated(true, completion: nil)
            }
            
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
        // This method is called when the scrollview finally stops scrolling.
    }
    

    
    
    
}
