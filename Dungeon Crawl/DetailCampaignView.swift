//
//  DetailCampaignView.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 30/9/23.
//

import SwiftUI
import SwiftData

struct DetailCampaignView: View {
    @Bindable var campaign: Campaign
    @Query(sort: \Player.nameCharacter, order: .forward, animation: .bouncy) var players: [Player]
    @Environment(\.modelContext) private var context
    @State var vm = DetailCampaignViewModel()
    @State var isEditing = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.bgDungeon.ignoresSafeArea()
                VStack(alignment: .leading, spacing: 30) {
                    VStack(alignment: .leading, spacing: 15) {
                        Text(campaign.name)
                            .font(.title)
                        Text(campaign.location)
                        Text("Lv. \(campaign.level)")
                    }
                    .padding(.horizontal)
                    VStack(alignment: .leading) {
                        VStack {
                            HStack() {
                                Text("Adventurers")
                                    .font(.title2)
                                Spacer()
                                Button {
                                    vm.showPlayerCreation.toggle()
                                } label: {
                                    HStack(alignment: .center) {
                                        Image(systemName: "person.fill.badge.plus")
                                            .foregroundStyle(Color.mainDungeon)
                                        Text("Add player")
                                    }
                                    .padding()
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.mainDungeon, lineWidth: 1)
                                    }
                                }
                            }
                            .padding()
                        }
                        .background(.black)
                        if let players = campaign.players {
                            List {
                                ForEach(players) { player in
                                    NavigationLink {
                                        DetailPlayerView(player: player)
                                    } label: {
                                        PlayerCell(player: player)
                                            .swipeActions(edge: .trailing) {
                                                Button(role: .destructive) {
                                                    Task {
                                                        await MainActor.run {
                                                            context.delete(player)
                                                            try? context.save()
                                                        }
                                                    }
                                                } label: {
                                                    Label("Delete", systemImage: "trash")
                                                }
                                            }
                                    }
                                }
                                .listRowBackground(Color.clear)
                                .listRowSeparator(.hidden)
                            }
                            .listStyle(.plain)
                            .scrollContentBackground(.hidden)
                        }
                    }
                    Spacer()
                }
            }
            .foregroundStyle(.white)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        isEditing.toggle()
                    }, label: {
                        Text("Edit")
                    })
                }
            }
            .fullScreenCover(isPresented: $vm.showPlayerCreation, content: {
                CreatePlayerView(campaign: campaign)
            })
        }
    }
}


#Preview {
    DetailCampaignView(campaign: Campaign.test)
        .modelContainer(for: Player.self, inMemory: true)
}
