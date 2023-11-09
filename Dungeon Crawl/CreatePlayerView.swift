//
//  CreatePlayerView.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 7/10/23.
//

import SwiftUI
import SwiftData

struct CreatePlayerView: View {
    @Environment(\.dismiss) var dismiss
    @State var vm = CreatePlayerViewModel()
    @Bindable var campaign: Campaign
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.bgDungeon.ignoresSafeArea()
                ScrollView {
                    VStack(alignment: .leading) {
                        Spacer()
                        VStack(spacing: 30) {
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
                        .padding(.horizontal, 30)
                        .foregroundStyle(.white)
                        carouselClasses()
                            .padding(.top, 30)
                            .padding(.bottom, 40)
                        VStack(spacing: 30) {
                            HStack {
                                Text("Alignement")
                                    .padding(.horizontal)
                                Spacer()
                                Picker("Select PC Race", selection: $vm.playerAlignment) {
                                    ForEach(AlignmentType.allCases, id: \.self) { item in
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
                            CustomMultipleTextField(title: "Ideals", titleKey: "Player Ideals", binding: $vm.playerIdeals)
                            CustomMultipleTextField(title: "Defects", titleKey: "Player Defects", binding: $vm.playerDefects)
                            HStack(spacing:5) {
                                Toggle(isOn: $vm.playerInspiration){
                                    HStack(spacing: 10) {
                                        Image(vm.playerInspiration ? "D20.fill" : "D20.empty")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 22)
                                            .foregroundStyle(vm.playerInspiration ? .white : .white.opacity(0.3))
                                        Text("Player Inspiration")
                                    }
                                }
                                .toggleStyle(SwitchToggleStyle(tint: Color.mainDungeon))
                                Spacer()
                                if vm.playerInspiration {
                                    Text("Yes!")
                                        .foregroundStyle(Color.secondaryDungeon)
                                        .fontWeight(.bold)
                                } else {
                                    Text("No")
                                        .opacity(0.5)
                                }
                            }
                            MainTextField(titleKey: "Player Name", binding: $vm.playerName, prompt: "Player name")
                            CustomMultipleTextField(title: "Notes", titleKey: "Player Notes", binding: $vm.playerNotes)
                            Button {
                                if vm.isFormValidate() {
                                    savePlayer()
                                    dismiss()
                                }
                            } label: {
                                Text("Create Player")
                            }
                            .buttonStyle(DungeonMainButton(isButtonEnabled: vm.isFormValidate()))
                            .padding(.bottom, 30)
                        }
                        .padding(.horizontal, 30)
                        .foregroundStyle(.white)
                        Spacer()
                    }
                    .padding(.vertical)
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
                .padding(.horizontal, 30)
                .foregroundStyle(.white)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(ClassType.allCases, id: \.self) { item in
                        VStack {
                            vm.getTypeImage(playerClass:item)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 80)
                                .foregroundStyle(Color.secondaryDungeon)
                            Text(item.rawValue)
                                .font(.title3)
                        }
                        .onTapGesture {
                            vm.playerClassType = item
                            print(vm.playerClassType)
                        }
                        .padding()
                        .foregroundStyle(.white)
                        .frame(width: 300)
                        .background() {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(vm.playerClassType == item ? Color.mainDungeon : .black)
                        }
                    }
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
        .safeAreaPadding(.horizontal, 30)
        }
    }
    
    func savePlayer() {
        withAnimation {
            let player = Player(nameCharacter: vm.characterName, namePlayer: vm.playerName,  level: vm.playerLevel, raceType: vm.playerRaceType, classType: vm.playerClassType, age: vm.playerAge, alignment: vm.playerAlignment, ideals: vm.playerIdeals, defects: vm.playerDefects, inspiration: vm.playerInspiration, notes: vm.playerNotes)
            print(player)
            campaign.players?.append(player)
        }
    }
}

#Preview {
    CreatePlayerView(campaign: Campaign.test)
        .modelContainer(for: Player.self, inMemory: true)
}
