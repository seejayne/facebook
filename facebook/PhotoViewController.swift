//
//  PhotoViewController.swift
//  facebook
//
//  Created by Jayne Vidheecharoen on 10/2/14.
//  Copyright (c) 2014 Jayne Vidheecharoen. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    var image: UIImage!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = image
        
        imageView.hidden = true
      
    }
    
    override func viewDidAppear(animated: Bool) {
        imageView.hidden = false
    }
    
    
    @IBAction func onDoneButton(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    

    
    
    
}
