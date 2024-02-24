//
//  NpcListView.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 22/11/23.
//

import SwiftUI
import SwiftData

struct NpcListView: View {
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
                            NavigationLink {
                                DetailNpcView(npc: npc)
                            } label: {
                                NpcCell(npc: npc, bgColor: Color.bgDungeon)
                                    .padding(.top)
                            }
                        }
                    }
                    .padding(10)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        withAnimation(.easeOut(duration: 1)) {
                            showNpcCreation.toggle()
                        }
                    } label: {
                        HStack(spacing: 5) {
                            Image(systemName: "plus.square.fill")
                            Text("Add NPC")
                                .font(.callout)
                        }
                        .foregroundStyle(Color.mainDungeon)
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
    NpcListView()
        .modelContainer(PreviewSampleData.container)
}
