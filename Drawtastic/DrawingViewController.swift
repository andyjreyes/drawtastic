//
//  ViewController.swift
//  Drawtastic
//
//  Created by Andy Reyes on 5/11/15.
//  Copyright (c) 2015 Andy Reyes. All rights reserved.
//

import UIKit

class DrawingViewController: UIViewController {
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //self.navigationItem.hidesBackButton = true;
    }
    
    override func viewWillAppear(animated: Bool) {
        resetDrawView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToDrawingViewController(sender: UIStoryboardSegue)
    {
        println("unwindToDrawingViewController just got called")
        let sourceViewController: AnyObject = sender.sourceViewController
        // Pull any data from the view controller which initiated the unwind segue.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    
    private func resetDrawView() {
        println("We are resetting the Draw View")
        activityIndicator.hidden = true
    }

    
}

