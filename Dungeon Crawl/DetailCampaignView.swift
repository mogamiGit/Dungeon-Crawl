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
    @Environment(\.modelContext) private var context
    @Query(sort: \Player.nameCharacter, order: .forward, animation: .smooth) var players: [Player]
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
                                Button() {
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
                            if !players.isEmpty {
                                List {
                                    ForEach(players, id:\.self) { player in
                                        NavigationLink {
                                            DetailPlayerView(player: player)
                                        } label: {
                                            PlayerCell(player: player)
                                        }
                                    }
                                    .onDelete(perform: { indexSet in
                                        for index in indexSet {
                                            context.delete(players[index])
                                        }
                                    })
                                    .listRowBackground(Color.clear)
                                    .listRowSeparator(.hidden)
                                }
                                .listStyle(.plain)
                                .scrollContentBackground(.hidden)
                            }
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
        .modelContainer(Campaign.previewContainer)
}
