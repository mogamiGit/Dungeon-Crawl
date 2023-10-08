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
    var playerClassType = ""
    var playerAge = 0
    var playerAlignment = ""
    var playerIdeals = ""
    var playerDefects = ""
    var playerInspiration = false
    var playerNotes = ""
    
    var newPlayer: Player {
        Player(name: playerName, level: Int(playerLevel), raceType: playerRaceType, classType: playerClassType, age: playerAge, alignment: playerAlignment, ideals: playerIdeals, defects: playerDefects, inspiration: playerInspiration, notes: playerNotes)
    }
}
