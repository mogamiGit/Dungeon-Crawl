//
//  CreateNpcViewModel.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 18/11/23.
//

import SwiftUI

@Observable
final class CreateNpcViewModel {
    var name = ""
    var level = 0
    var raceType = ""
    var age = 0
    var occupation = ""
    var location = ""
    var background = ""
    var alignment: AlignmentNPC = .neutral
    var appearance = ""
    var notes = ""
    
    /*NPC Drives*/
    var tags: [String] = []
    var legacy = ""
    var value = ""
    var beliefs = ""
}
