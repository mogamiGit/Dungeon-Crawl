//
//  NPC.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 30/9/23.
//

import Foundation
import SwiftData

@Model
final public class NPC {
    @Attribute(.externalStorage) var imageData: Data?
    var name: String
    var raceType: String
    var age: Int
    var occupation: String
    var location: String
    var background: String
    var alignment: AlignmentNPC
    var appearance: String
    var legacy: String
    var value: String
    var beliefs: String
    var notes: String?
    
    init(imageData: Data? = nil, name: String, raceType: String, age: Int, occupation: String, location: String, background: String, alignment: AlignmentNPC, appearance: String, legacy: String, value: String, beliefs: String, notes: String?) {
        self.imageData = imageData
        self.name = name
        self.raceType = raceType
        self.age = age
        self.occupation = occupation
        self.location = location
        self.background = background
        self.alignment = alignment
        self.appearance = appearance
        self.legacy = legacy
        self.value = value
        self.beliefs = beliefs
        self.notes = notes
    }
    
    static func exampleNPC() -> NPC {
        return NPC(
                   name: "Denolun",
                   raceType: "Akaosian",
                   age: 34,
                   occupation: "Artist",
                   location: "Neverwinter",
                   background: "Started out in more dramatic acting, but found people just laughed at them.",
                   alignment: AlignmentNPC.chaoticevil,
                   appearance: "Dark hair in thick curls held tight to the head, walking with a slight limp.",
                   legacy: "This NPC wants to be famous for their performance and an ability to improvise.",
                   value: "This NPC likes to be the center of attention, and will be dramatic to get it.",
                   beliefs: "This NPC believes strongly in the tents of a local deity.",
                   notes: "Has a wind-up toy in the shape of a chick that he talks to all the time.")
    }
}

enum AlignmentNPC: String, Codable, CaseIterable {
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

