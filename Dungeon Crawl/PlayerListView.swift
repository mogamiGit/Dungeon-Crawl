//
//  PlayerListView.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 12/11/23.
//

import SwiftUI
import SwiftData

struct PlayerListView: View {
    @Bindable var campaign: Campaign
    @Query(sort: \Player.nameCharacter, order: .forward, animation: .bouncy) var players: [Player]
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    @State var showDeleteConfirmation = false
    @State var showPlayerCreation = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                VStack {
                    HStack() {
                        Text("Adventurers")
                            .font(.title2)
                        Spacer()
                        Button {
                            showPlayerCreation.toggle()
                        } label: {
                            HStack(alignment: .center) {
                                Image(systemName: "person.fill.badge.plus")
                                    .foregroundStyle(Color.mainDungeon)
                                Text("Add player")
                                    .foregroundStyle(.white)
                            }
                        }
                    }
                    .padding(25)
                }
                List {
                    ForEach(players) { player in
                        NavigationLink {
                            DetailPlayerView(player: player)
                        } label: {
                            PlayerCell(player: player)
                                .swipeActions(edge: .trailing) {
                                    Button {
                                        showDeleteConfirmation.toggle()
                                    } label: {
                                        Label("Delete", systemImage: "eraser")
                                    }
                                    .tint(Color.mainDungeon)
                                }
                                .alert("¿Are you sure you want to delete \(player.nameCharacter)", isPresented: $showDeleteConfirmation, actions: {
                                    Button("Delete", role: .destructive) {
                                        Task {
                                            await MainActor.run {
                                                context.delete(player)
                                                try? context.save()
                                            }
                                        }
                                    }
                                    Button("Cancel", role: .cancel) { }
                                })
                        }
                    }
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
            }
        }
        .fullScreenCover(isPresented: $showPlayerCreation, content: {
            CreatePlayerView(campaign: campaign)
        })
    }
}

#Preview {
    PlayerListView(campaign: Campaign.exampleCampaign())
        .modelContainer(PreviewSampleData.container)
}
