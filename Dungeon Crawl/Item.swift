//
//  Item.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 14/9/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
