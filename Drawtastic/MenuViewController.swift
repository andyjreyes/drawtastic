//
//  MenuViewController.swift
//  Drawtastic
//
//  Created by Andy Reyes on 5/14/15.
//  Copyright (c) 2015 Andy Reyes. All rights reserved.
//

import UIKit

class MenuViewController: UITableViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        MPCManager.onConnect { _ in
            self.updatePlayers()
        }
        
        MPCManager.onDisconnect { _ in
            self.updatePlayers()
        }
        
        MPCManager.onEvent(.StartGame, run: { (_, object) -> Void in
            self.performSegueWithIdentifier("PlayerListToDrawSegue", sender: nil)
        })
    }
    
    override func viewWillDisappear(animated: Bool) {
        MPCManager.onConnect(nil)
        MPCManager.onDisconnect(nil)
        MPCManager.onEvent(.StartGame, run: nil)
        
        super.viewWillDisappear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func updatePlayers() {
        navigationItem.rightBarButtonItem?.enabled = (MPCManager.otherPlayers.count > 0)
        tableView.reloadData()
    }
    
    // MARK: User Actions
    
    // When someone hits the "Everyone's Here" button,
    // ALL players segue and start the game!
    @IBAction func startGame(sender: UIBarButtonItem) {
        println("This got hit!")
        MPCManager.sendEvent(Event.StartGame)
        self.performSegueWithIdentifier("PlayerListToDrawSegue", sender: nil)
    }


    @IBAction func refresh(sender: UIRefreshControl) {
        sender.beginRefreshing()
        
        updatePlayers()

        sender.endRefreshing()
    }
    
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return MPCManager.otherPlayers.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Player Cell", forIndexPath: indexPath) as! UITableViewCell

        cell.textLabel?.text = MPCManager.otherPlayers[indexPath.row].name
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
