//
//  MonsterListItem.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 10/2/24.
//

import Foundation


struct MonsterListItem: Codable, Hashable, Identifiable {
    var id = UUID()
    let index: String
    let name: String
    let url: String
}
