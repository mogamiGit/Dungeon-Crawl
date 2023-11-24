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
    
    /*NPC Drives*/
    var npcTags: [String] = []
    var npcLegacy = ""
    var npcValue = ""
    var npcBeliefs = ""
}
