//
//  ViewController.swift
//  Drawtastic
//
//  Created by Andy Reyes on 5/11/15.
//  Copyright (c) 2015 Andy Reyes. All rights reserved.
//

import UIKit

class DrawingViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //self.navigationItem.hidesBackButton = true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToDrawingViewController(sender: UIStoryboardSegue)
    {
        let sourceViewController: AnyObject = sender.sourceViewController
        // Pull any data from the view controller which initiated the unwind segue.
    }


}

