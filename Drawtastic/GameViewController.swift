//
//  GameViewController.swift
//  Drawtastic
//
//  Created by Andy Reyes on 5/21/15.
//  Copyright (c) 2015 Andy Reyes. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var descriptionText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //self.navigationItem.hidesBackButton = true;
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
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
        
        // Test code for stiting image representations of views together. It works!
        //        let myTextView: UITextView = UITextView(frame: CGRectMake(0, 0, 200, 50))
        //        myTextView.text = "This is how we do it! Shalalalala!"
        //        UIImageWriteToSavedPhotosAlbum(self.view.image, nil, nil, nil)
        //        UIImageWriteToSavedPhotosAlbum(UIView.joinImages([myTextView.image, self.view.image, myTextView.image, self.view.image, myTextView.image, self.view.image]), nil, nil, nil)
        
        println(MPCManager.allPlayers.map({return $0.name}))
    }
    
    private func resetDrawView() {
        println("We are resetting the Draw View")
        
        //activityIndicator.hidden = true
        
        // Remove the previously drawn image
        if let drawView = self.view as? JCDrawView {
            drawView.resetImage()
        }
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        textField.resignFirstResponder()
        return true
    }

}
