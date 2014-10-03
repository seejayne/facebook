//
//  NewsFeedViewController.swift
//  facebook
//
//  Created by Jayne Vidheecharoen on 9/15/14.
//  Copyright (c) 2014 Jayne Vidheecharoen. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var wedding1View: UIImageView!
    @IBOutlet weak var wedding2View: UIImageView!
    @IBOutlet weak var wedding3View: UIImageView!
    @IBOutlet weak var wedding4View: UIImageView!
    @IBOutlet weak var wedding5View: UIImageView!
    
    var imageViewToSegue : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = imageView.frame.size
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        var destinationViewController = segue.destinationViewController as PhotoViewController
        destinationViewController.image = self.imageViewToSegue.image
    }

    @IBAction func onTap(gestureRecognizer: UITapGestureRecognizer) {
        imageViewToSegue = gestureRecognizer.view as UIImageView
        performSegueWithIdentifier("photoSegue", sender: self)
        
    }

}
