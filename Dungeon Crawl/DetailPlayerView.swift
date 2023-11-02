//
//  DetailPlayerView.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 2/11/23.
//

import SwiftUI

struct DetailPlayerView: View {
    @Bindable var player: Player
    
    var body: some View {
        Text(player.nameCharacter)
    }
}

#Preview {
    DetailPlayerView(player: Player.test)
}
