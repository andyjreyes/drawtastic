//
//  DescribingViewController.swift
//  Drawtastic
//
//  Created by Andy Reyes on 5/14/15.
//  Copyright (c) 2015 Andy Reyes. All rights reserved.
//

import UIKit

class DescribingViewController: UIViewController {
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.hidesBackButton = true;
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        resetDescribeView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    
    private func resetDescribeView() {
        println("We are resetting the Describe View")
        activityIndicator.hidden = true
    }
    
    
}
