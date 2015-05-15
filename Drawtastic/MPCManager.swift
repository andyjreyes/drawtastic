//
//  MPCManager.swift
//  Drawtastic
//
//  Created by Andy Reyes on 5/14/15.
//  Copyright (c) 2015 Andy Reyes. All rights reserved.
//

import Foundation
import PeerKit
import MultipeerConnectivity

struct MPCManager {
    
    // MARK: Properties
    
    private static var peers: [MCPeerID] {
        return PeerKit.session?.connectedPeers as! [MCPeerID]? ?? []
    }
    
    static var otherPlayers: [Player] {
        return peers.map { Player(peerID: $0) }
    }
    
    // MARK: Start
    
    static func start() {
        PeerKit.transceive("drawtastic")
    }
    
    // MARK: Event Handling
    
    static func onConnect(run: PeerBlock?) {
        PeerKit.onConnect = run
    }
    
    static func onDisconnect(run: PeerBlock?) {
        PeerKit.onDisconnect = run
    }
}
