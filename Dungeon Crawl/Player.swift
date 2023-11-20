//
//  Player.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 30/9/23.
//

import Foundation
import SwiftData
import SwiftUI

@Model
final public class Player {
    var nameCharacter: String
    @Attribute(.unique) var namePlayer: String
    var level: Int
    var raceType: RaceType
    var classType: ClassType
    var age: Int
    var alignment: AlignmentPlayer
    var ideals: String
    var defects: String
    var inspiration: Bool
    var notes: String?
    
    @Relationship(inverse: \Campaign.players)
    var campaign: Campaign?
    
    init(nameCharacter: String, namePlayer: String, level: Int, raceType: RaceType, classType: ClassType, age: Int, alignment: AlignmentPlayer, ideals: String, defects: String, inspiration: Bool, notes: String?) {
        self.nameCharacter = nameCharacter
        self.namePlayer = namePlayer
        self.level = level
        self.raceType = raceType
        self.classType = classType
        self.age = age
        self.alignment = alignment
        self.ideals = ideals
        self.defects = defects
        self.inspiration = inspiration
        self.notes = notes
    }
    
    var idealsArray: [String] {
        ideals.components(separatedBy: ",")
    }
    
    var defectsArray: [String] {
        defects.components(separatedBy: ",")
    }
    
    static func examplePlayer() -> Player {
        return Player(nameCharacter: "Sefard The Scapist",
                      namePlayer: "Leon",
                      level: 5,
                      raceType: RaceType.human,
                      classType: ClassType.wizard,
                      age: 25,
                      alignment: AlignmentPlayer.chaoticgood,
                      ideals: "Justice and Freedom, Become a hero, Have a family",
                      defects: "Impatient, Good guy, Gullible, Braggart",
                      inspiration: true,
                      notes: "Has a pet owl named Hoot")
    }
    
    static func examplePlayer2() -> Player {
        return Player(nameCharacter: "Pleok",
                      namePlayer: "Jane",
                      level: 5,
                      raceType: RaceType.halforc,
                      classType: ClassType.fighter,
                      age: 45,
                      alignment: AlignmentPlayer.neutral,
                      ideals: "Revenge, Become a leader, Have an evil army",
                      defects: "Dumb, Sweet tooth, Big mouth",
                      inspiration: false,
                      notes: "Has a vampire sword")
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

enum RaceType: String, Codable, CaseIterable {
    case dragonborn = "Dragonborn"
    case dwarf = "Dwarf"
    case elf = "Elf"
    case gnome = "Gnome"
    case halfelf = "Half-elf"
    case halforc = "Half-orc"
    case halfling = "Halfling"
    case human = "Human"
    case tiefling = "Tiefling"
}

enum AlignmentPlayer: String, Codable, CaseIterable {
    case chaoticevil = "Chaotic-evil"
    case chaoticgood = "Chaotic-good"
    case chaoticneutral = "Chaotic-neutral"
    case lawfulevil = "Lawful-evil"
    case lawfulgood = "Lawful-good"
    case lawfulneutral = "Lawful-neutral"
    case neutral = "Neutral"
    case neutralevil = "Neutral-evil"
    case neutralgood = "Neutral-good"
}
