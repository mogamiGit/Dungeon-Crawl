//
//  PlayerModel.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 30/9/23.
//

import Foundation
import SwiftData

@Model
final class Player {
    @Attribute(.unique) var name: String
    var level: String
    var raceType: String
    var classType: String
    var age: Int
    var alignment: String
    var ideals: String
    var defects: String
    var inspiration: Bool
    var notes: String?
    
    init(name: String, level: String, raceType: String, classType: String, age: Int, alignment: String, ideals: String, defects: String, inspiration: Bool, notes: String?) {
        self.name = name
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
}
