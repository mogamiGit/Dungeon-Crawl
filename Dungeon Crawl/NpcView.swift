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
    @State var showNpcCreation = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.secondaryDungeon.ignoresSafeArea()
                ScrollView {
                    LazyVGrid(columns: Array(repeating: GridItem(), count: 2),spacing: 10) {
                        ForEach(npcs) { npc in
                            NpcCell(npc: npc, bgColor: Color.bgDungeon)
                                .padding(.top)
                        }
                    }
                    .padding(10)
                }
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        showNpcCreation.toggle()
                    } label: {
                        HStack {
                            Image(systemName: "plus")
                            Text("Create NPC")
                        }
                        .foregroundStyle(Color.mainDungeon)
                        .padding(.bottom, 40)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle("NPCs")
        }
        .fullScreenCover(isPresented: $showNpcCreation, content: {
            CreateNpcView()
        })
    }
}

#Preview {
    NpcView()
        .modelContainer(PreviewSampleData.container)
}
