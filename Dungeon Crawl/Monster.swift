//
//  Monster.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 10/2/24.
//

import Foundation

// MARK: - NewMonster
struct NewMonster : Codable, Identifiable {
    var id = UUID()
    let index : String?
    let name : String?
    let size : String?
    let type : String?
    let subtype : String?
    let alignment : String?
    let armor_class : [New_Armor_class]?
    let hit_points : Int?
    let hit_dice : String?
    let hit_points_roll : String?
    let speed : New_Speed?
    let strength : Int?
    let dexterity : Int?
    let constitution : Int?
    let intelligence : Int?
    let wisdom : Int?
    let charisma : Int?
    let proficiencies : [New_Proficiencies]?
    let damage_vulnerabilities : [String]?
    let damage_resistances : [String]?
    let damage_immunities : [String]?
    let condition_immunities : [New_Condition_immunities]?
    let senses : New_Senses?
    let languages : String?
    let challenge_rating : Int?
    let proficiency_bonus : Int?
    let xp : Int?
    let special_abilities : [New_Special_abilities]?
    let actions : [New_Actions]?
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

struct New_Armor_class : Codable {
    let type : String?
    let value : Int?

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case value = "value"
    }
}

struct New_Proficiencies : Codable {
    let value : Int?
    let proficiency : New_Proficiency?

    enum CodingKeys: String, CodingKey {
        case value = "value"
        case proficiency = "proficiency"
    }
}

struct New_Condition_immunities : Codable {
    let index : String?
    let name : String?
    let url : String?

    enum CodingKeys: String, CodingKey {
        case index = "index"
        case name = "name"
        case url = "url"
    }
}

struct New_Proficiency : Codable {
    let index : String?
    let name : String?
    let url : String?

    enum CodingKeys: String, CodingKey {
        case index = "index"
        case name = "name"
        case url = "url"
    }
}

struct New_Special_abilities : Codable {
    let name : String?
    let desc : String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case desc = "desc"
    }
}

struct New_Actions : Codable {
    let name : String?
    let desc : String?
    let attack_bonus : Int?
    let damage : [New_Damage]?
    let actions : [String]?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case desc = "desc"
        case attack_bonus = "attack_bonus"
        case damage = "damage"
        case actions = "actions"
    }
}

struct New_Damage : Codable {
    let damage_type : New_Damage_type?
    let damage_dice : String?

    enum CodingKeys: String, CodingKey {
        case damage_type = "damage_type"
        case damage_dice = "damage_dice"
    }
}

struct New_Damage_type : Codable {
    let index : String?
    let name : String?
    let url : String?

    enum CodingKeys: String, CodingKey {
        case index = "index"
        case name = "name"
        case url = "url"
    }
}

struct New_Speed : Codable {
    let walk : String?

    enum CodingKeys: String, CodingKey {
        case walk = "walk"
    }
}

struct New_Senses : Codable {
    let darkvision : String?
    let passive_perception : Int?

    enum CodingKeys: String, CodingKey {
        case darkvision = "darkvision"
        case passive_perception = "passive_perception"
    }
}

extension MonsterDTO {
    func toNewMosterModel() -> NewMonster {
        NewMonster(index: index,
                   name: name,
                   size: size,
                   type: type,
                   subtype: subtype,
                   alignment: alignment,
                   armor_class: armor_class?.map { $0.toNewArmorClass() },
                   hit_points: hit_points,
                   hit_dice: hit_dice,
                   hit_points_roll: hit_points_roll,
                   speed: speed?.toNewSpeed(),
                   strength: strength,
                   dexterity: dexterity,
                   constitution: constitution,
                   intelligence: intelligence,
                   wisdom: wisdom,
                   charisma: charisma,
                   proficiencies: proficiencies?.map { $0.toNewProficiencies() },
                   damage_vulnerabilities: damage_vulnerabilities,
                   damage_resistances: damage_resistances,
                   damage_immunities: damage_immunities,
                   condition_immunities: condition_immunities?.map { $0.toNewConditionInmunities() },
                   senses: senses?.toNewSenses(),
                   languages: languages,
                   challenge_rating: challenge_rating,
                   proficiency_bonus: proficiency_bonus,
                   xp: xp,
                   special_abilities: special_abilities?.map { $0.toNewSpecialHabitilies() },
                   actions: actions?.map { $0.toNewActions() },
                   url: url,
                   legendary_actions: legendary_actions)
    }
}

extension Armor_class {
    func toNewArmorClass() -> New_Armor_class {
        New_Armor_class(type: type, value: value)
    }
}

extension Speed {
    func toNewSpeed() -> New_Speed {
        New_Speed(walk: walk)
    }
}

extension Proficiencies {
    func toNewProficiencies() -> New_Proficiencies {
        New_Proficiencies(value: value, proficiency: proficiency?.toNewProficiency())
    }
}

extension Proficiency {
    func toNewProficiency() -> New_Proficiency {
        New_Proficiency(index: index, name: name, url: url)
    }
}

extension Condition_immunities {
    func toNewConditionInmunities() -> New_Condition_immunities {
        New_Condition_immunities(index: index, name: name, url: url)
    }
}

extension Senses {
    func toNewSenses() -> New_Senses {
        New_Senses(darkvision: darkvision, passive_perception: passive_perception)
    }
}

extension Special_abilities {
    func toNewSpecialHabitilies() -> New_Special_abilities {
        New_Special_abilities(name: name, desc: desc)
    }
}

extension Actions {
    func toNewActions() -> New_Actions {
        New_Actions(name: name, desc: desc, attack_bonus: attack_bonus, damage: damage?.map { $0.toNewDamage() }, actions: actions)
    }
}

extension Damage {
    func toNewDamage() -> New_Damage {
        New_Damage(damage_type: damage_type?.toNewDamageType(), damage_dice: damage_dice)
    }
}

extension Damage_type {
    func toNewDamageType() -> New_Damage_type {
        New_Damage_type(index: index, name: name, url: url)
    }
}


