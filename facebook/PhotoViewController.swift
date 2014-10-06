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
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var photoControls: UIImageView!
    
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
    
    func convertValue(value: Float, r1Min: Float, r1Max: Float, r2Min: Float, r2Max: Float) -> Float {
        
        var ratio = (r2Max - r2Min) / (r1Max - r1Min)
        return value * ratio + r2Min - r1Min * ratio
    }

    @IBAction func onDoneButton(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        var offset = Float(scrollView.contentOffset.y)
        
        var convertedAlpha = convertValue(offset, r1Min: -200, r1Max: 0, r2Min: 0, r2Max: 1)

        
        view.backgroundColor = UIColor(white: 0, alpha: CGFloat(convertedAlpha))
        doneButton.alpha = CGFloat(convertedAlpha)
        photoControls.alpha = CGFloat(convertedAlpha)
        
        //UIColor(white: 0, alpha: alpha)
    }

    
    func scrollViewDidEndDragging(scrollView: UIScrollView!,
        willDecelerate decelerate: Bool) {
            
        var offset = Float(scrollView.contentOffset.y)
    
            if offset < -100 {
                imageView.hidden = true
                dismissViewControllerAnimated(true, completion: nil)
            }
    }
    
    
    


    
    
    
}
