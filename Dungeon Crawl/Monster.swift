//
//  Monster.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 10/2/24.
//

import SwiftUI

// MARK: - NewMonster
struct NewMonster: Codable, Identifiable {
    var id = UUID()
    let index: String
    let name: String
    let size: String
    let type: String
    let subtype: String
    let alignment: String
    let armorClass: [NewArmorclass]
    let hitPoints: Int
    let hitDice: String
    let hitPointsRoll: String
    let speed: NewSpeed
    let strength: Int
    let dexterity: Int
    let constitution: Int
    let intelligence: Int
    let wisdom: Int
    let charisma: Int
    let damageVulnerabilities: [String]
    let damageResistances: [String]
    let damageImmunities: [String]
    let senses: NewSenses
    let languages: String
    let challengeRating: Double
    let proficiencyBonus: Int
    let xp: Int
    let specialAbilities: [NewSpecialAbilities]?
    let actions: [NewActions]?
    let image: String?
    let url : String

    enum CodingKeys: String, CodingKey {
        case index = "index"
        case name = "name"
        case size = "size"
        case type = "type"
        case subtype = "subtype"
        case alignment = "alignment"
        case armorClass = "armor_class"
        case hitPoints = "hit_points"
        case hitDice = "hit_dice"
        case hitPointsRoll = "hit_points_roll"
        case speed = "speed"
        case strength = "strength"
        case dexterity = "dexterity"
        case constitution = "constitution"
        case intelligence = "intelligence"
        case wisdom = "wisdom"
        case charisma = "charisma"
        case damageVulnerabilities = "damage_vulnerabilities"
        case damageResistances = "damage_resistances"
        case damageImmunities = "damage_immunities"
        case senses = "senses"
        case languages = "languages"
        case challengeRating = "challenge_rating"
        case proficiencyBonus = "proficiency_bonus"
        case xp = "xp"
        case specialAbilities = "special_abilities"
        case actions = "actions"
        case image = "image"
        case url = "url"
    }
}

extension NewMonster {
    static var exampleMonster2: NewMonster {
        let armorClass = NewArmorclass(type: "dex", value: 10)
        let senses = NewSenses(darkvision: "60 ft.", passive_perception: 10)
        let specialAbilitie01 = NewSpecialAbilities(name: "Amorphous", desc: "The shadow can move through a space as narrow as 1 inch wide without squeezing.")
        let specialAbilitie02 = NewSpecialAbilities(name: "Sunlight Weakness", desc: "While in sunlight, the shadow has disadvantage on attack rolls, ability checks, and saving throws.")
        let action = NewActions(name: "Strength Drain", desc: "Melee Weapon Attack: +4 to hit, reach 5 ft.")
        let speed = NewSpeed(walk: "20 ft.", swim: "10 ft.", burrow: "25 ft.", climb: "10 ft.")
        
        return NewMonster(index: "acolyte", name: "Acolyte", size: "Medium", type: "humanoid", subtype: "any race", alignment: "any alignment", armorClass: [armorClass], hitPoints: 9, hitDice: "2d8", hitPointsRoll: "2d8", speed: speed, strength: 10, dexterity: 10, constitution: 10, intelligence: 10, wisdom: 10, charisma: 14, damageVulnerabilities: ["fire","lightning","high level conversations"], damageResistances: ["common sense"], damageImmunities: ["radiant"], senses: senses, languages: "common", challengeRating: 0.5, proficiencyBonus: 2, xp: 100, specialAbilities: [specialAbilitie01, specialAbilitie02], actions: [action], image: "/api/images/monsters/shadow.png", url: "/api/monsters/shadow")
    }
}

struct NewArmorclass : Codable {
    let type : String
    let value : Int

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case value = "value"
    }
}

struct NewSpecialAbilities : Codable {
    let name : String
    let desc : String

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case desc = "desc"
    }
}

struct NewActions : Codable {
    let name : String
    let desc : String

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case desc = "desc"
    }
}

struct NewSpeed : Codable {
    let walk: String
    let swim: String
    let burrow: String
    let climb: String

    enum CodingKeys: String, CodingKey {
        case walk = "walk"
        case swim = "swim"
        case burrow = "burrow"
        case climb = "climb"
    }
}

struct NewSenses : Codable {
    let darkvision : String
    let passive_perception : Int

    enum CodingKeys: String, CodingKey {
        case darkvision = "darkvision"
        case passive_perception = "passive_perception"
    }
}


