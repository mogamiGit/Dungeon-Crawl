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
    @Relationship(deleteRule: .cascade) var players: [Player]?
    @Relationship(deleteRule: .cascade) var encounters: [Encounter]?
    @Relationship(inverse: \NPC.campaign) var npcs: [NPC]?
    
    init(name: String, location: String, level: Int, players: [Player]) {
        self.name = name
        self.location = location
        self.level = level
    }
    
    static func exampleCampaign() -> Campaign {
        return Campaign(name: "Left Handed Company",
                        location: "Nevewinter",
                        level: 4,
                        players: [])
    }
    
    static func exampleCampaignWithPlayers() -> Campaign {
        let campaign = Campaign(name: "Magic DnD Trip",
                        location: "Castle Darkhold",
                                level: 4, players: [])
        campaign.players?.append(Player.examplePlayer())
        campaign.players?.append(Player.examplePlayer2())
        return campaign
    }
}


