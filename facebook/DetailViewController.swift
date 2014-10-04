//
//  DetailViewController.swift
//  facebook
//
//  Created by Jayne Vidheecharoen on 9/15/14.
//  Copyright (c) 2014 Jayne Vidheecharoen. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBAction func likeButtonClicked(sender: UIButton) {
        sender.selected = !sender.selected
    }
    
    @IBAction func backButton(sender: UIButton) {
        navigationController?.popViewControllerAnimated(true)

    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
