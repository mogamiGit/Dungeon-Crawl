//
//  Encounter.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 30/9/23.
//

import Foundation
import SwiftData

@Model
final class Encounter {
    @Attribute(.unique) var id: UUID
    var name: String
    var level: String
    var location: String
    var monsters: [Monster]?
    var treasures: [Treasure]?
    
    @Relationship(inverse: \Campaign.encounters)
    var campaign: Campaign?
    
    init(id: UUID = UUID(), name: String, level: String, location: String) {
        self.id = id
        self.name = name
        self.level = level
        self.location = location
    }
}

@Model
final class Monster {
    @Attribute(.unique) var id: UUID
    var name: String
    var size: String
    var type: String
    var alignment: String
    
    init(id: UUID = UUID(), name: String, size: String, type: String, aligment: String) {
        self.id = id
        self.name = name
        self.size = size
        self.type = type
        self.alignment = aligment
    }
}

@Model
final class Treasure {
    var name: String
    var cuantity: Int?
    var value: String
    
    init(name: String, cuantity: Int? = 0, value: String) {
        self.name = name
        self.cuantity = cuantity
        self.value = value
    }
}
