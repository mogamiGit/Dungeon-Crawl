//
//  DetailPlayerView.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 2/11/23.
//

import SwiftUI

struct DetailPlayerView: View {
    @Bindable var player: Player
    @Bindable var campaign: Campaign
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) private var presentationMode
    @State var showDeleteConfirmation = false
    @State var playerEdit: Player?
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.bgDungeon.ignoresSafeArea()
                ScrollView {
                    VStack(spacing: 20) {
                        VStack {
                            Text(player.nameCharacter)
                                .font(.title)
                            Text(player.namePlayer)
                                .font(.caption)
                        }
                        Text("Lv.\(player.level)")
                        Text(player.raceType.rawValue)
                        Text(player.classType.rawValue)
                        Text("\(player.age)")
                        Text(player.alignment.rawValue)
                        Text(player.ideals)
                        Text(player.defects)
                        Text(player.notes ?? "")
                        if player.inspiration == true {
                            Text("Inspiration YES")
                        } else {
                            Text("Inspiration NO")
                        }
                    }
                }
            }
            .foregroundStyle(.white)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        playerEdit = player
                    }, label: {
                        Image("edit")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20)
                            .foregroundStyle(.white)
                    })
                }
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        showDeleteConfirmation.toggle()
                    } label: {
                        HStack {
                            Image(systemName: "xmark")
                            Text("Delete player")
                        }
                        .padding(.bottom, 40)
                        .foregroundStyle(Color.mainDungeon)
                    }
                }
            }
            .alert("¿Are you sure you want to delete \(player.nameCharacter)", isPresented: $showDeleteConfirmation, actions: {
                Button("Delete", role: .destructive) {
                    delete(player)
                }
                Button("Cancel", role: .cancel) { }
            })
        }
    }
    
    private func delete(_ player: Player) {
        context.delete(player)
        campaign.players.removeAll(where: { innerPlayer in
            innerPlayer == player
        })
        do {
            try context.save()
            presentationMode.wrappedValue.dismiss()
        } catch {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    DetailPlayerView(player: Player.examplePlayer(), campaign: Campaign.exampleCampaign())
}
