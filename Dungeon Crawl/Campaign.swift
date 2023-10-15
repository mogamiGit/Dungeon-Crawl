//
//  Campaign.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 19/9/23.
//

import Foundation
import SwiftData

@Model
final class Campaign {
    @Attribute(.unique) var name: String
    var location: String
    var level: Int
    @Relationship(deleteRule: .cascade) var players: [Player]?
    @Relationship(deleteRule: .cascade) var NPCs: [NPCModel]?
    @Relationship(deleteRule: .cascade) var encounters: [EncounterModel]?
    
    init(name: String, location: String, level: Int, players: [Player]) {
        self.name = name
        self.location = location
        self.level = level
    }
}


