//
//  UpdatePlayerViewModel.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 3/12/23.
//

import Foundation

@Observable
final class UpdatePlayerViewModel {
    
    var updatedPlayerName = ""
    var updatedCharacterName = ""
    var updatedPlayerLevel = 0
    var updatedPlayerRaceType: RaceType = .human
    var updatedPlayerClassType: ClassType = .barbarian
    var updatedPlayerAge = 0
    var updatedPlayerAlignment: AlignmentPlayer = .neutral
    var updatedPlayerIdeals = ""
    var updatedPlayerDefects = ""
    var updatedPlayerInspiration = false
    var updatedPlayerNotes = ""
    
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
    
    func fetchDataPlayer(player: Player) {
        updatedPlayerName = player.namePlayer
        updatedCharacterName = player.nameCharacter
        updatedPlayerLevel = player.level
        updatedPlayerRaceType = player.raceType
        updatedPlayerClassType = player.classType
        updatedPlayerAge = player.age
        updatedPlayerAlignment = player.alignment
        updatedPlayerIdeals = player.ideals
        updatedPlayerDefects = player.defects
        updatedPlayerInspiration = player.inspiration
        updatedPlayerNotes = player.notes ?? ""
    }
    
    func isFormValidate() -> Bool {
        if updatedPlayerName.isEmpty || updatedPlayerLevel == 0 || updatedPlayerAge == 0 || updatedPlayerIdeals.isEmpty || updatedPlayerDefects.isEmpty {
            return false
        }
        return true
    }
}
