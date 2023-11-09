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
    @Environment(\.dismiss) var dismiss
    @State var vm = DetailCampaignViewModel()
    @State private var campaignEdit: Campaign?
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.bgDungeon.ignoresSafeArea()
                VStack(alignment: .leading, spacing: 30) {
                    VStack(spacing: 15) {
                        Text(campaign.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        HStack(spacing: 30) {
                            HStack {
                                Image("location")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20)
                                    .foregroundStyle(Color.secondaryDungeon)
                                Text(campaign.location)
                            }
                            Text("Lv. \(campaign.level)")
                                .foregroundStyle(Color.secondaryDungeon)
                        }
                        .foregroundStyle(Color.gray)
                    }
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity)
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
                                            .foregroundStyle(Color.accentDungeon)
                                        Text("Add player")
                                    }
                                    .padding()
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.accentDungeon, lineWidth: 1)
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
                                                Button {
                                                    vm.showDeleteConfirmation.toggle()
                                                } label: {
                                                    Label("Delete", systemImage: "eraser")
                                                }
                                                .tint(Color.mainDungeon)
                                            }
                                            .alert("¿Are you sure you want to delete \(player.nameCharacter)", isPresented: $vm.showDeleteConfirmation, actions: {
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
                    Spacer()
                }
            }
            .foregroundStyle(.white)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        campaignEdit = campaign
                    }, label: {
                        Image("edit")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20)
                            .foregroundStyle(.white)
                    })
                }
            }
            .fullScreenCover(isPresented: $vm.showPlayerCreation, content: {
                CreatePlayerView(campaign: campaign)
            })
            .fullScreenCover(item: $campaignEdit) { campaign in
                UpdateCampaignView(campaign: campaign)
            }
        }
    }
}


#Preview {
    DetailCampaignView(campaign: Campaign.test)
        .modelContainer(for: Player.self, inMemory: true)
}
