//
//  PlayerCell.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 22/10/23.
//

import SwiftUI

struct PlayerCell: View {
    @Bindable var player: Player
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    PlayerCell(player: Player.test)
}
