//
//  UpdateNpcViewModel.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 6/12/23.
//

import Foundation

@Observable
final class UpdateNpcViewModel {
    var updateNpcName = ""
    var updateNpcRaceType = ""
    var updateNpcAge = ""
    var updateNpcOccupation = ""
    var updateNpcLocation = ""
    var updateNpcBackground = ""
    var updateNpcAlignment: AlignmentNPC = .neutral
    var updateNpcAppearance = ""
    var updateNpcNotes = ""
    var updateNpcLegacy = ""
    var updateNpcValue = ""
    var updateNpcBeliefs = ""
    
    func isFormValidate() -> Bool {
        if updateNpcName.isEmpty || updateNpcRaceType.isEmpty || updateNpcAge.isEmpty || updateNpcOccupation.isEmpty || updateNpcLocation.isEmpty || updateNpcBackground.isEmpty || updateNpcAppearance.isEmpty || updateNpcLegacy.isEmpty || updateNpcValue.isEmpty || updateNpcBeliefs.isEmpty {
            return false
        }
        return true
    }
    
    func fetchDataNpc(npc: NPC) {
        updateNpcName = npc.name
        updateNpcRaceType = npc.raceType
        updateNpcAge = String(npc.age)
        updateNpcOccupation = npc.occupation
        updateNpcLocation = npc.location
        updateNpcBackground = npc.background
        updateNpcAlignment = npc.alignment
        updateNpcAppearance = npc.appearance
        updateNpcNotes = npc.notes ?? ""
        updateNpcLegacy = npc.legacy
        updateNpcValue = npc.value
        updateNpcBeliefs = npc.beliefs
    }
}
