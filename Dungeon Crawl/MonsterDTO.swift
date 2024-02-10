//
//  MonsterDTO.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 28/1/24.
//

import Foundation

// MARK: - MonsterDTO
struct MonsterDTO : Codable {
    let index : String?
    let name : String?
    let size : String?
    let type : String?
    let subtype : String?
    let alignment : String?
    let armor_class : [Armor_class]?
    let hit_points : Int?
    let hit_dice : String?
    let hit_points_roll : String?
    let speed : Speed?
    let strength : Int?
    let dexterity : Int?
    let constitution : Int?
    let intelligence : Int?
    let wisdom : Int?
    let charisma : Int?
    let proficiencies : [Proficiencies]?
    let damage_vulnerabilities : [String]?
    let damage_resistances : [String]?
    let damage_immunities : [String]?
    let condition_immunities : [Condition_immunities]?
    let senses : Senses?
    let languages : String?
    let challenge_rating : Int?
    let proficiency_bonus : Int?
    let xp : Int?
    let special_abilities : [Special_abilities]?
    let actions : [Actions]?
    let url : String?
    let legendary_actions : [String]?

    enum CodingKeys: String, CodingKey {
        case index = "index"
        case name = "name"
        case size = "size"
        case type = "type"
        case subtype = "subtype"
        case alignment = "alignment"
        case armor_class = "armor_class"
        case hit_points = "hit_points"
        case hit_dice = "hit_dice"
        case hit_points_roll = "hit_points_roll"
        case speed = "speed"
        case strength = "strength"
        case dexterity = "dexterity"
        case constitution = "constitution"
        case intelligence = "intelligence"
        case wisdom = "wisdom"
        case charisma = "charisma"
        case proficiencies = "proficiencies"
        case damage_vulnerabilities = "damage_vulnerabilities"
        case damage_resistances = "damage_resistances"
        case damage_immunities = "damage_immunities"
        case condition_immunities = "condition_immunities"
        case senses = "senses"
        case languages = "languages"
        case challenge_rating = "challenge_rating"
        case proficiency_bonus = "proficiency_bonus"
        case xp = "xp"
        case special_abilities = "special_abilities"
        case actions = "actions"
        case url = "url"
        case legendary_actions = "legendary_actions"
    }
}

struct Armor_class : Codable {
    let type : String?
    let value : Int?

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case value = "value"
    }
}

struct Proficiencies : Codable {
    let value : Int?
    let proficiency : Proficiency?

    enum CodingKeys: String, CodingKey {
        case value = "value"
        case proficiency = "proficiency"
    }
}

struct Condition_immunities : Codable {
    let index : String?
    let name : String?
    let url : String?

    enum CodingKeys: String, CodingKey {
        case index = "index"
        case name = "name"
        case url = "url"
    }
}

struct Proficiency : Codable {
    let index : String?
    let name : String?
    let url : String?

    enum CodingKeys: String, CodingKey {
        case index = "index"
        case name = "name"
        case url = "url"
    }
}

struct Special_abilities : Codable {
    let name : String?
    let desc : String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case desc = "desc"
    }
}

struct Actions : Codable {
    let name : String?
    let desc : String?
    let attack_bonus : Int?
    let damage : [Damage]?
    let actions : [String]?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case desc = "desc"
        case attack_bonus = "attack_bonus"
        case damage = "damage"
        case actions = "actions"
    }
}

struct Damage : Codable {
    let damage_type : Damage_type?
    let damage_dice : String?

    enum CodingKeys: String, CodingKey {
        case damage_type = "damage_type"
        case damage_dice = "damage_dice"
    }
}

struct Damage_type : Codable {
    let index : String?
    let name : String?
    let url : String?

    enum CodingKeys: String, CodingKey {
        case index = "index"
        case name = "name"
        case url = "url"
    }
}

struct Speed : Codable {
    let walk : String?

    enum CodingKeys: String, CodingKey {
        case walk = "walk"
    }
}

struct Senses : Codable {
    let darkvision : String?
    let passive_perception : Int?

    enum CodingKeys: String, CodingKey {
        case darkvision = "darkvision"
        case passive_perception = "passive_perception"
    }
}
