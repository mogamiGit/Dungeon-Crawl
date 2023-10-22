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
    
    init(id: UUID = UUID(), name: String, level: String, location: String) {
        self.id = id
        self.name = name
        self.level = level
        self.location = location
    }
}

@Model
final class Monster {
    var name: String
    var locationInMap: String
    var quantity: Int // por defecto 1. Por cada uno se añade un icono. Cuando son más de 5 de añade un icono + number nada más.
    var size: String
    var strength: Int
    var dexterity: Int
    var constitution: Int
    var intelligence: Int
    var wisdom: Int
    var charisma: Int
    var senses: Senses?
    var actions: [Action]
    
    init(name: String, locationInMap: String, quantity: Int, size: String, strength: Int, dexterity: Int, constitution: Int, intelligence: Int, wisdom: Int, charisma: Int, actions: [Action]) {
        self.name = name
        self.locationInMap = locationInMap
        self.quantity = quantity
        self.size = size
        self.strength = strength
        self.dexterity = dexterity
        self.constitution = constitution
        self.intelligence = intelligence
        self.wisdom = wisdom
        self.charisma = charisma
        self.actions = actions
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

@Model
final class Senses {
    var darkvision: String
    var passivePerception: Int
    
    init(darkvision: String, passivePerception: Int) {
        self.darkvision = darkvision
        self.passivePerception = passivePerception
    }
}

@Model
final class Action {
    var name: String
    var descriptionAction: String
    
    init(name: String, descriptionAction: String) {
        self.name = name
        self.descriptionAction = descriptionAction
    }
}
