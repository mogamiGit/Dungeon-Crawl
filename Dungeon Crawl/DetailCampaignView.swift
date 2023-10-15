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
    @Query var players: [Player]
    @State var vm = DetailCampaignViewModel()
    
    var body: some View {
        ZStack {
            Color.bgDungeon.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 30) {
                VStack(alignment: .leading) {
                    Text("Players")
                        .font(.title2)
                        .fontWeight(.bold)
                    if let players = campaign.players {
                        if !players.isEmpty {
                            List {
                                ForEach(players) { player in
                                    Text(player.name)
                                }
                                .listRowBackground(Color.clear)
                                .listRowSeparator(.hidden)
                            }
                            .listStyle(.plain)
                            .scrollContentBackground(.hidden)
                        }
                    }
                    Button() {
                        vm.showPlayerCreation.toggle()
                    } label: {
                        HStack() {
                            Image(systemName: "person.fill.badge.plus")
                            Text("Add new player")
                            Spacer()
                        }
                        .padding()
                        .background() {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.white).opacity(0.1).ignoresSafeArea()
                        }
                    }
                }
                Spacer()
            }
            .padding(30)
            .foregroundStyle(.white)
        }
        .fullScreenCover(isPresented: $vm.showPlayerCreation, content: {
            CreatePlayerView(campaign: campaign)
        })
    }
}

#Preview {
    DetailCampaignView(campaign: Campaign.test)
        .modelContainer(Campaign.previewContainer)
}
