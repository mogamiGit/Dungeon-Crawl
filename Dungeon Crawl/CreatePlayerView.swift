//
//  CreatePlayerView.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 7/10/23.
//

import SwiftUI
import SwiftData

struct CreatePlayerView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.horizontalSizeClass) private var sizeClass
    @State var vm = CreatePlayerViewModel()
    @Bindable var campaign: Campaign
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.bgDungeon.ignoresSafeArea()
                ScrollView {
                    VStack(alignment: .leading) {
                        Spacer()
                        VStack(spacing: Constant.spaceBetweenElements) {
                            MainTextField(titleKey: "Character Name", binding: $vm.characterName, prompt: "Character name")
                            CustomSlider(binding: $vm.playerLevel, number:vm.playerLevel, title: "Player Level", limit: 20)
                            HStack {
                                Text("Select Race")
                                    .padding(.horizontal)
                                Spacer()
                                Picker("Select PC Race", selection: $vm.playerRaceType) {
                                    ForEach(RaceType.allCases, id: \.self) { item in
                                        Text(item.rawValue)
                                    }
                                }
                                .accentColor(.creamDungeon)
                                .pickerStyle(.menu)
                            }
                            .onChange(of: vm.playerRaceType) { oldValue, newValue in
                                vm.playerAge = 0
                            }
                            .padding(10)
                            .background() {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.white).opacity(0.1)
                            }
                        }
                        .padding(.horizontal, Constant.containerHPadding)
                        carouselClasses()
                            .padding(.top, 30)
                            .padding(.bottom, 40)
                        VStack(spacing: Constant.spaceBetweenElements) {
                            HStack {
                                Text("Alignement")
                                    .padding(.horizontal)
                                Spacer()
                                Picker("Select PC Race", selection: $vm.playerAlignment) {
                                    ForEach(AlignmentPlayer.allCases, id: \.self) { item in
                                        Text(item.rawValue)
                                    }
                                }
                                .accentColor(.creamDungeon)
                                .pickerStyle(.menu)
                            }
                            .padding(10)
                            .background() {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.white).opacity(0.1)
                            }
                            CustomSlider(binding: $vm.playerAge, number: vm.playerAge, title: "Player Age", limit: vm.getNumberForRace(playerRace: vm.playerRaceType))
                            CustomMultipleTextField(title: "Ideals", titleKey: "Player Ideals", promptText: "Enter ideals separated by commas", binding: $vm.playerIdeals)
                            CustomMultipleTextField(title: "Defects", titleKey: "Player Defects", promptText: "Enter defects separated by commas", binding: $vm.playerDefects)
                            HStack(spacing:5) {
                                Toggle(isOn: $vm.playerInspiration){
                                    Text("Player Inspiration")
                                }
                                .toggleStyle(CustomToggleStyle())
                            }
                            MainTextField(titleKey: "Player Name", binding: $vm.playerName, prompt: "Player name")
                            CustomMultipleTextField(title: "Notes", titleKey: "Player Notes", promptText: "Enter text", binding: $vm.playerNotes)
                            Button {
                                if vm.isFormValidate() {
                                    savePlayer()
                                    dismiss()
                                }
                            } label: {
                                Text("Create Player")
                            }
                            .buttonStyle(DungeonMainButton(isButtonEnabled: vm.isFormValidate()))
                        }
                        .padding(.horizontal, Constant.containerHPadding)
                        Spacer()
                    }
                    .padding(.vertical)
                    .foregroundStyle(.white)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(.white)
                            .padding(8)
                            .background {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.mainDungeon)
                            }
                            .padding(.bottom)
                    }
                    .padding()
                }
            }
        }
    }
    
    @ViewBuilder
    func carouselClasses() -> some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Select Class")
                .padding(.horizontal, Constant.containerHPadding)
                .foregroundStyle(.white)
                .fontWeight(.bold)
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(ClassType.allCases, id: \.self) { item in
                        VStack {
                            Image(item.rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 70)
                                .foregroundStyle(Color.secondaryDungeon)
                            Text(item.rawValue)
                                .font(.callout)
                        }
                        .onTapGesture {
                            vm.playerClassType = item
                        }
                        .scrollTransition(axis: .horizontal) { content, phase in
                            content
                                .scaleEffect(x: phase.isIdentity ? 1.0 : 0.8, y: phase.isIdentity ? 1.0 : 0.8)
                        }
                        .containerRelativeFrame(.horizontal, count: sizeClass == .regular ? 3 : 2, spacing: 10.0)
                        .frame(height: 150)
                        .foregroundStyle(.white)
                        .background() {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(vm.playerClassType == item ? Color.mainDungeon : .black)
                        }
                    }
                }
                .scrollTargetLayout()
            }
            .contentMargins(.horizontal, Constant.containerHPadding)
            .scrollTargetBehavior(.viewAligned)
            .scrollIndicators(.hidden)
        }
    }
    
    func savePlayer() {
        withAnimation {
            let player = Player(nameCharacter: vm.characterName, namePlayer: vm.playerName,  level: vm.playerLevel, raceType: vm.playerRaceType, classType: vm.playerClassType, age: vm.playerAge, alignment: vm.playerAlignment, ideals: vm.playerIdeals, defects: vm.playerDefects, inspiration: vm.playerInspiration, notes: vm.playerNotes)
            player.campaign = campaign
            campaign.players.append(player)
        }
        vm.characterName = ""
        vm.playerName = ""
        vm.playerIdeals = ""
        vm.playerDefects = ""
        vm.playerNotes = ""
    }
}

#Preview {
    CreatePlayerView(campaign: Campaign.exampleCampaign())
}
