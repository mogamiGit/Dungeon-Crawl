//
//  MonsterList.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 10/2/24.
//

import Foundation

struct MonsterListItemDTO : Codable {
    let count: Int
    let results: [ResultsDTO]

    enum CodingKeys: String, CodingKey {
        case count = "count"
        case results = "results"
    }
}

struct ResultsDTO: Codable {
    let index: String
    let name: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case index = "index"
        case name = "name"
        case url = "url"
    }
}

extension ResultsDTO {
    var toNewResults: MonsterListItem {
        MonsterListItem(index: index, name: name, url: url)
    }
}
