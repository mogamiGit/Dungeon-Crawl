//
//  CampaignModel.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 19/9/23.
//

import Foundation

struct CampaignModel: Codable, Identifiable {
    var id = UUID()
    let name: String
//    let players: [Player]
//    let NPCs: [NPC]?
//    let encounters: [Encounter]?
}

struct Player: Codable {
    let name: String
    let level: String
    let raceType: String
    let classType: String
    let age: Int
    let alignment: String
    let ideals: String
    let defects: String
    let inspiration: Bool
    let notes: String?
}

struct NPC: Codable {
    let name: String
    let level: String?
    let raceType: String
    let age: Int
    let occupation: String
    let location: String
    let background: String
    let alignment: String
    let appearance: String
    let drives: DriveNPC
    let notes: String?
}

struct Encounter: Codable {
    let name: String
    let level: String
    let location: String
    let monsters: [Monster]
    let treasures: [Treasure]
}

struct DriveNPC: Codable {
    let legacy: String
    let value: String
    let beliefs: String
}

struct Monster: Codable {
    let index: String
    let name: String
    let locationInMap: String
    let size: String
    let speed: String //first walk(?)
    let strength: Int
    let dexterity: Int
    let constitution: Int
    let intelligence: Int
    let wisdom: Int
    let charisma: Int
    let senses: Senses
    let actions: [Action]
}

struct Treasure: Codable {
    let name: String
    let cuantity: Int?
    let value: String
}

struct Senses: Codable {
    let darkvision: String
    let passivePerception: Int
}

struct Action: Codable {
    
}


