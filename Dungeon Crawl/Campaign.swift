//
//  Campaign.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 19/9/23.
//

import Foundation
import SwiftData

@Model
final public class Campaign {
    @Attribute(.unique) var name: String
    var location: String
    var level: Int
    @Relationship(deleteRule: .cascade) var players: [Player] = []
    @Relationship(deleteRule: .cascade) var encounters: [Encounter] = []
    
    init(name: String, location: String, level: Int) {
        self.name = name
        self.location = location
        self.level = level
    }
    
    static func exampleCampaign() -> Campaign {
        return Campaign(name: "Left Handed Company",
                        location: "Neverwinter",
                        level: 4)
    }
    
    static func exampleCampaignWithPlayers() -> Campaign {
        let campaign = Campaign(name: "Magic DnD Trip",
                        location: "Castle Darkhold",
                                level: 4)
        campaign.players.append(Player.examplePlayer())
        campaign.players.append(Player.examplePlayer2())
        return campaign
    }
}

enum Tab: String, CaseIterable {
    case players = "Players"
    case encounters = "Fights"
    
    var iconTab: String {
        switch self {
        case .players:
            return "D20.empty"
        case .encounters:
            return "swords"
        }
    }
}


