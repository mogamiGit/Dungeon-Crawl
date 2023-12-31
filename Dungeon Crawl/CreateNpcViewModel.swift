//
//  CreateNpcViewModel.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 18/11/23.
//

import SwiftUI

@Observable
final class CreateNpcViewModel {
    var npcName = ""
    var npcRaceType = ""
    var npcAge = ""
    var npcOccupation = ""
    var npcLocation = ""
    var npcBackground = ""
    var npcAlignment: AlignmentNPC = .neutral
    var npcAppearance = ""
    var npcNotes = ""
    var npcLegacy = ""
    var npcValue = ""
    var npcBeliefs = ""
    
    func isFormValidate() -> Bool {
        if npcName.isEmpty || npcRaceType.isEmpty || npcAge.isEmpty || npcOccupation.isEmpty || npcLocation.isEmpty || npcBackground.isEmpty || npcAppearance.isEmpty || npcLegacy.isEmpty || npcValue.isEmpty || npcBeliefs.isEmpty {
            return false
        }
        return true
    }
}
