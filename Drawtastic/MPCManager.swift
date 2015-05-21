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

protocol MPCSerializable {
    var mpcSerialized: NSData { get }
    init(mpcSerialized: NSData)
}

enum Event: String {
    case StartGame = "StartGame",
    TimesUp = "TimesUp",
    FinishedDrawing = "FinishedDrawing",
    FinishedDescribing = "FinishedDescribing",
    ReceivedNextItem = "ReceivedNextItem",
    EndGame = "EndGame"
}

struct MPCManager {
    
    // MARK: Properties
    
    private static var peers: [MCPeerID] {
        return PeerKit.session?.connectedPeers as! [MCPeerID]? ?? []
    }
    
    static var otherPlayers: [Player] {
        var playerArray: [Player] = peers.map { Player(peerID: $0) }
        playerArray.sort({$0.name < $1.name})
        return playerArray
    }
    
    static var allPlayers: [Player] {
        var playerArray: [Player] = [Player.getMe()] + otherPlayers
        playerArray.sort({$0.name < $1.name})
        return playerArray
    }
    
    static var nextRecipient: Player {
        // If you are last in line, your nextRecipient is first in line
        if allPlayers.last!.name == Player.getMe().name
        {
            return allPlayers.first!
        }
        
        // Find the next person in line after you
        for (var i = 0; i < allPlayers.count; i++)
        {
            if allPlayers[i].name == Player.getMe().name
            {
                // Don't worry, we can't go off the array here
                return allPlayers[i+1]
            }
        }
        
        // Should never reach here
        println("We couldn't find the nextRecipient? Impossible!")
        return allPlayers.first!
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
    
    static func onEvent(event: Event, run: ObjectBlock?) {
        if let run = run {
            PeerKit.eventBlocks[event.rawValue] = run
        } else {
            PeerKit.eventBlocks.removeValueForKey(event.rawValue)
        }
    }
    
    // MARK: Sending
    
    static func sendEvent(event: Event, object: [String: MPCSerializable]? = nil, toPeers peers: [MCPeerID]? = PeerKit.session?.connectedPeers as! [MCPeerID]?) {
        var anyObject: [String: NSData]?
        if let object = object {
            anyObject = [String: NSData]()
            for (key, value) in object {
                anyObject![key] = value.mpcSerialized
            }
        }
        
        PeerKit.sendEvent(event.rawValue, object: anyObject, toPeers: peers)
    }
    
    static func sendEventForEach(event: Event, objectBlock: () -> ([String: MPCSerializable])) {
        for peer in MPCManager.peers {
            MPCManager.sendEvent(event, object: objectBlock(), toPeers: [peer])
        }
    }
}
