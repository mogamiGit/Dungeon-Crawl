//
//  NpcView.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 22/11/23.
//

import SwiftUI
import SwiftData

struct NpcView: View {
    @Query(sort: \NPC.name, order: .reverse, animation: .bouncy) var npcs: [NPC]
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(), count: 2),spacing: 5) {
                    ForEach(npcs) { npc in
                        NpcCell(npc: npc)
                    }
                }
                .padding(10)
            }
        }
    }
}

#Preview {
    NpcView()
        .modelContainer(PreviewSampleData.container)
}
