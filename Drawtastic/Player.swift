//
//  Player.swift
//  Drawtastic
//
//  Created by Andy Reyes on 5/14/15.
//  Copyright (c) 2015 Andy Reyes. All rights reserved.
//

import Foundation
import MultipeerConnectivity

struct Player
{
    let name: String
    
    // MARK: Initializers
    
    init(name: String) {
        self.name = name
    }
    
    init(peerID: MCPeerID) {
        name = peerID.displayName
    }
    
}