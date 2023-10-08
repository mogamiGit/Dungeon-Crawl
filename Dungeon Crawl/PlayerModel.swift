//
//  PlayerModel.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 30/9/23.
//

import Foundation
import SwiftData

@Model
final class PlayerModel {
    var name: String
    var level: Int
    var raceType: String
    var classType: String
    var age: Int
    var alignment: String
    var ideals: String
    var defects: String
    var inspiration: Bool
    var notes: String?
    
    init(name: String, level: Int, raceType: String, classType: ClassType = .barbarian, age: Int, alignment: String, ideals: String, defects: String, inspiration: Bool, notes: String?) {
        self.name = name
        self.level = level
        self.raceType = raceType
        self.classType = classType.rawValue
        self.age = age
        self.alignment = alignment
        self.ideals = ideals
        self.defects = defects
        self.inspiration = inspiration
        self.notes = notes
    }
}

enum ClassType: String, Codable, CaseIterable {
    case barbarian = "Barbarian"
    case bard = "Bard"
    case cleric = "Cleric"
    case druid = "Druid"
    case fighter = "Fighter"
    case monk = "Monk"
    case paladin = "Paladin"
    case ranger = "Ranger"
    case rogue = "Rogue"
    case sorcerer = "Sorcerer"
    case warlock = "Warlock"
    case wizard = "Wizard"
}
