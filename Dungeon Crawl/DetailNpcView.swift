//
//  DetailNpcView.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 3/12/23.
//

import SwiftUI

struct DetailNpcView: View {
    @Bindable var npc: NPC
    
    var body: some View {
        Text(npc.name)
    }
}

#Preview {
    DetailNpcView(npc: .exampleNPC())
}
