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
                    VStack(alignment: .leading, spacing: 40) {
                        HStack() {
                            VStack(alignment: .leading, spacing: 5) {
                                Text(player.nameCharacter)
                                    .font(.title)
                                    .fontWeight(.semibold)
                                HStack {
                                    Image(systemName: "person.fill")
                                    Text(player.namePlayer)
                                        .font(.subheadline)
                                }
                                .foregroundStyle(.gray)
                            }
                            Spacer()
                            VStack {
                                Text("Lv.\(player.level)")
                            }
                            .padding(10)
                            .frame(width: 60, height: 60)
                            .background {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 2.0)
                                    .fill(Color.accentDungeon)
                            }
                        }
                        VStack {
                            HStack(spacing: 10) {
                                SquareFlexibleModule(useVStack: true, colorBackground: Color.secondaryDungeon.opacity(0.7)) {
                                    Text("\(player.age)")
                                        .font(.title)
                                    Text("years")
                                        .font(.caption)
                                }
                                SquareFlexibleModule(useVStack: true, colorBackground: Color.secondaryDungeon.opacity(0.2)) {
                                    Image(player.raceType.rawValue)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxWidth: 50, maxHeight: 40)
                                    Text(player.raceType.rawValue)
                                        .font(.caption)
                                }
                                SquareFlexibleModule(useVStack: true, colorBackground: Color.secondaryDungeon.opacity(0.2)) {
                                    Image(player.classType.rawValue)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxWidth: 50, maxHeight: 40)
                                    Text(player.classType.rawValue)
                                        .font(.caption)
                                }
                            }
                            HStack(spacing: 10) {
                                SquareFlexibleModule(useVStack: false, colorBackground: Color.secondaryDungeon.opacity(0.2)) {
                                    Image(player.alignment.rawValue)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 22)
                                    Text(player.alignment.rawValue)
                                        .font(.caption)
                                }
                                SquareFlexibleModule(useVStack: false, colorBackground: player.inspiration ? Color.accentDungeon.opacity(0.9) :  Color.secondaryDungeon.opacity(0.2)) {
                                    Image(player.inspiration ? "D20.fill" : "D20.empty")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 22)
                                    Text("Inspiration")
                                        .font(.caption)
                                }
                            }
                        }
                        bigListModule(title: "Ideals", definition: player.idealsArray)
                        bigListModule(title: "Defects", definition: player.defectsArray)
                        VStack(alignment: .leading) {
                            Text("Notes")
                                .fontWeight(.bold)
                            VStack(alignment: .leading) {
                                Text(player.notes ?? "")
                            }
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding(20)
                            .background() {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 1.0)
                                    .foregroundStyle(.gray)
                            }
                        }
                        HStack {
                            Spacer()
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
                    .padding(.top)
                    .padding(.horizontal, Constant.containerHPadding)
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
            }
            .alert("¿Are you sure you want to delete \(player.nameCharacter)", isPresented: $showDeleteConfirmation, actions: {
                Button("Delete", role: .destructive) {
                    delete(player)
                }
                Button("Cancel", role: .cancel) { }
            })
        }
    }
    
    @ViewBuilder
    func bigListModule(title: String, definition: [String]) -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text("-")
                Text(title)
                Text("-")
            }
            .font(.subheadline)
            .fontWeight(.bold)
            LazyVGrid(columns: [GridItem(.flexible(minimum: 80, maximum: .infinity), spacing: 5)], alignment: .leading) {
                ForEach(definition, id: \.self) { ideal in
                    HStack(alignment: .center) {
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 10)
                            .foregroundStyle(Color.accentDungeon)
                            .fontWeight(.bold)
                        Text(ideal)
                            .foregroundStyle(.white)
                    }
                }
            }
            .padding(20)
            .background() {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 1.0)
                    .fill(.gray)
            }
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
