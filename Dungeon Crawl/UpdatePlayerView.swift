//
//  UpdatePlayerView.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 3/12/23.
//

import SwiftUI

struct UpdatePlayerView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.horizontalSizeClass) private var sizeClass
    
    @Bindable var player: Player
    @State var vm = UpdatePlayerViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.bgDungeon.ignoresSafeArea()
                ScrollView {
                    VStack(alignment: .leading) {
                        VStack(spacing: Constant.spaceBetweenElements) {
                            MainTextField(titleKey: "Character Name", binding: $vm.updatedCharacterName, prompt: "Character name*")
                            CustomSlider(binding: $vm.updatedPlayerLevel, number:vm.updatedPlayerLevel, title: "Player Level*", limit: 20)
                            HStack {
                                Text("Select Race")
                                    .padding(.horizontal)
                                Spacer()
                                Picker("Select PC Race", selection: $vm.updatedPlayerRaceType) {
                                    ForEach(RaceType.allCases, id: \.self) { item in
                                        Text(item.rawValue)
                                    }
                                }
                                .accentColor(.creamDungeon)
                                .pickerStyle(.menu)
                            }
                            .onChange(of: vm.updatedPlayerRaceType) { oldValue, newValue in
                                vm.updatedPlayerAge = 0
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
                                Picker("Select PC Race", selection: $vm.updatedPlayerAlignment) {
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
                            CustomSlider(binding: $vm.updatedPlayerAge, number: vm.updatedPlayerAge, title: "Player Age*", limit: vm.getNumberForRace(playerRace: vm.updatedPlayerRaceType))
                            CustomMultipleTextField(title: "Ideals*", titleKey: "Player Ideals", promptText: "Enter ideals separated by commas", binding: $vm.updatedPlayerIdeals)
                            CustomMultipleTextField(title: "Defects*", titleKey: "Player Defects", promptText: "Enter defects separated by commas", binding: $vm.updatedPlayerDefects)
                            HStack(spacing:5) {
                                Toggle(isOn: $vm.updatedPlayerInspiration){
                                    Text("Player Inspiration")
                                }
                                .toggleStyle(CustomToggleStyle())
                            }
                            MainTextField(titleKey: "Player Name", binding: $vm.updatedPlayerName, prompt: "Player name*")
                            CustomMultipleTextField(title: "Notes", titleKey: "Player Notes", promptText: "Enter text", binding: $vm.updatedPlayerNotes)
                            Button {
                                if vm.isFormValidate() {
                                    updatePlayer()
                                    dismiss()
                                }
                            } label: {
                                Text("Save Player")
                            }
                            .buttonStyle(DungeonMainButton(isButtonEnabled: vm.isFormValidate()))
                            Text("Fill in all required fields in order to complete (*)")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        .padding(.horizontal, Constant.containerHPadding)
                        Spacer()
                    }
                    .onAppear {
                        vm.fetchDataPlayer(player: player)
                    }
                    .padding(.vertical, 30)
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
                            vm.updatedPlayerClassType = item
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
                                .fill(vm.updatedPlayerClassType == item ? Color.mainDungeon : .black)
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
    
    func updatePlayer() {
        player.namePlayer = vm.updatedPlayerName
        player.nameCharacter = vm.updatedCharacterName
        player.level = vm.updatedPlayerLevel
        player.raceType = vm.updatedPlayerRaceType
        player.classType = vm.updatedPlayerClassType
        player.age = vm.updatedPlayerAge
        player.alignment = vm.updatedPlayerAlignment
        player.ideals = vm.updatedPlayerIdeals
        player.defects = vm.updatedPlayerDefects
        player.inspiration = vm.updatedPlayerInspiration
        player.notes = vm.updatedPlayerNotes
    }
}

#Preview {
    UpdatePlayerView(player: .examplePlayer())
}
