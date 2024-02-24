//
//  MonsterDTO.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 28/1/24.
//

import Foundation

// MARK: - MonsterDTO
struct MonsterDTO : Codable {
    let index: String
    let name: String
    let size: String
    let type: String
    let subtype: String?
    let alignment: String
    let armorClass: [ArmorClass]
    let hitPoints: Int
    let hitDice: String
    let hitPointsRoll: String
    let speed: Speed
    let strength: Int
    let dexterity: Int
    let constitution: Int
    let intelligence: Int
    let wisdom: Int
    let charisma: Int
    let proficiencies: [Proficiencies]
    let damageVulnerabilities: [String]?
    let damageResistances: [String]?
    let damageImmunities: [String]?
    let senses: Senses
    let languages: String
    let challengeRating: Double
    let proficiencyBonus: Int
    let xp: Int
    let specialAbilities: [SpecialAbilities]?
    let actions: [ActionsM]?
    let image: String?
    let url: String

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
        case proficiencies = "proficiencies"
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

struct ArmorClass : Codable {
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

struct SpecialAbilities : Codable {
    let name : String?
    let desc : String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case desc = "desc"
    }
}

struct ActionsM : Codable {
    let name : String?
    let desc : String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case desc = "desc"
    }
}

struct Speed: Codable {
    let walk: String?
    let swim: String?
    let burrow: String?
    let climb: String?

    enum CodingKeys: String, CodingKey {
        case walk = "walk"
        case swim = "swim"
        case burrow = "burrow"
        case climb = "climb"
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

extension MonsterDTO {
    func toNewMosterModel() -> NewMonster {
        NewMonster(index: index,
                   name: name,
                   size: size,
                   type: type,
                   subtype: subtype ?? "no subtype",
                   alignment: alignment,
                   armorClass: armorClass.map { $0.toNewArmorClass() },
                   hitPoints: hitPoints,
                   hitDice: hitDice,
                   hitPointsRoll: hitPointsRoll,
                   speed: speed.toNewSpeed(),
                   strength: strength,
                   dexterity: dexterity,
                   constitution: constitution,
                   intelligence: intelligence,
                   wisdom: wisdom,
                   charisma: charisma,
                   damageVulnerabilities: damageVulnerabilities ?? ["acid"],
                   damageResistances: damageResistances ?? ["fire"],
                   damageImmunities: damageImmunities ?? ["acid","necrotic"],
                   senses: senses.toNewSenses(),
                   languages: languages,
                   challengeRating: challengeRating,
                   proficiencyBonus: proficiencyBonus,
                   xp: xp,
                   specialAbilities: specialAbilities?.map { $0.toNewSpecialAbitilies() },
                   actions: actions?.map { $0.toNewActions() },
                   image: image ?? "placeholder",
                   url: url)
    }
}

extension ArmorClass {
    func toNewArmorClass() -> NewArmorclass {
        NewArmorclass(type: type ?? "no type", value: value ?? 0)
    }
}

extension Speed {
    func toNewSpeed() -> NewSpeed {
        NewSpeed(walk: walk ?? "no walk", swim: swim ?? "no swim", burrow: burrow ?? "no burrow", climb: climb ?? "no climb")
    }
}

extension Senses {
    func toNewSenses() -> NewSenses {
        NewSenses(darkvision: darkvision ?? "no darkvision", passive_perception: passive_perception ?? 0)
    }
}

extension SpecialAbilities {
    func toNewSpecialAbitilies() -> NewSpecialAbilities {
        NewSpecialAbilities(name: name ?? "no name", desc: desc ?? "no description")
    }
}

extension ActionsM {
    func toNewActions() -> NewActions {
        NewActions(name: name ?? "no name", desc: desc ?? "no description")
    }
}
