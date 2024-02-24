//
//  TabBarItemModel.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 25/1/24.
//

import Foundation

enum TabBarItems: Int, CaseIterable{
    case campaigns = 0
    case npcs
    case bestiary
    
    var title: String{
        switch self {
        case .campaigns:
            return "Campaigns"
        case .npcs:
            return "NPCs"
        case .bestiary:
            return "Bestiary"
        }
    }
    
    var iconName: String{
        switch self {
        case .campaigns:
            return "D20.empty"
        case .npcs:
            return "group.people"
        case .bestiary:
            return "bestiary"
        }
    }
}
