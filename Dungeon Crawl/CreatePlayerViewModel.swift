//
//  CreatePlayerViewModel.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 7/10/23.
//

import Foundation

@Observable
class CreatePlayerViewModel {
    static let shared = CreatePlayerViewModel()
    
    var playerName = ""
    var playerLevel = 0
    var playerRaceType = ""
    var playerClassType = ClassType.RawValue()
    var playerAge = 0
    var playerAlignment = ""
    var playerIdeals = ""
    var playerDefects = ""
    var playerInspiration = false
    var playerNotes = ""
    
    var newPlayer: PlayerModel {
        PlayerModel(name: playerName, level: playerLevel, raceType: playerRaceType, classType: ClassType(rawValue: playerClassType) ?? .wizard, age: playerAge, alignment: playerAlignment, ideals: playerIdeals, defects: playerDefects, inspiration: playerInspiration, notes: playerNotes)
    }
}
