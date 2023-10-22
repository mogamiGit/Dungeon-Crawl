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
    var playerRaceType = RaceType.dragonborn
    var playerClassType = ClassType.barbarian
    var playerAge = 0
    var playerAlignment = AlignmentType.neutral
    var playerIdeals = ""
    var playerDefects = ""
    var playerInspiration = false
    var playerNotes = ""
    
    func getNumberForRace(playerRace: RaceType) -> Double {
        switch RaceType(rawValue: playerRace.rawValue) {
        case .dragonborn:
            return 80
        case .dwarf:
            return 350
        case .elf:
            return 750
        case .gnome:
            return 500
        case .halfelf:
            return 180
        case .halforc:
            return 75
        case .halfling:
            return 150
        case .human:
            return 120
        case .tiefling:
            return 270
        case .none:
            return 0
        }
    }
    
    func isFormValidate() -> Bool {
        if playerName.isEmpty || playerLevel == 0 || playerAge == 0 || playerIdeals.isEmpty || playerDefects.isEmpty {
            return false
        }
        return true
    }
}
