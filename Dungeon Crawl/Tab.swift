//
//  Tab.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 12/11/23.
//

import Foundation

enum Tab: String, CaseIterable {
    case players = "Players"
    case npcs = "NPCs"
    case encounters = "Fights"
    
    var iconTab: String {
        switch self {
        case .players:
            return "person.2.fill"
        case .npcs:
            return "person.3"
        case .encounters:
            return "exclamationmark.bubble.fill"
        }
    }
}
