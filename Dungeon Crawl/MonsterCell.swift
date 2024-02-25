//
//  MonsterCell.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 25/2/24.
//

import SwiftUI

struct MonsterCell: View {
    let monster: MonsterListItem
    
    var body: some View {
        HStack {
            Text(monster.name)
        }
    }
}

#Preview {
    MonsterCell(monster: MonsterListItem(index: "adult-black-dragon", name: "Adult Black Dragon", url: "/api/monsters/adult-black-dragon"))
}
