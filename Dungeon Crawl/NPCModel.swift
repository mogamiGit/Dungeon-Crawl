//
//  NPCModel.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 30/9/23.
//

import Foundation
import SwiftData

@Model
final class NPCModel {
    var name: String
    var level: String? = nil
    var raceType: String
    var age: Int
    var occupation: String
    var location: String
    var background: String
    var alignment: String
    var appearance: String
    var drives: DriveNPC
    var notes: String?
    
    init(name: String, level: String? = nil, raceType: String, age: Int, occupation: String, location: String, background: String, alignment: String, appearance: String, drives: DriveNPC) {
        self.name = name
        self.level = level
        self.raceType = raceType
        self.age = age
        self.occupation = occupation
        self.location = location
        self.background = background
        self.alignment = alignment
        self.appearance = appearance
        self.drives = drives
    }
}

@Model
final class DriveNPC {
    var legacy: String
    var value: String
    var beliefs: String
    
    init(legacy: String, value: String, beliefs: String) {
        self.legacy = legacy
        self.value = value
        self.beliefs = beliefs
    }
}
