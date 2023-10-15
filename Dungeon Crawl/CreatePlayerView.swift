//
//  CreatePlayerView.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 7/10/23.
//

import SwiftUI

struct CreatePlayerView: View {
    @State var vm = CreatePlayerViewModel()
    
    var body: some View {
        ZStack {
            Color.bgDungeon.ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 30) {
                    VStack(spacing: 30) {
                        MainTextField(titleKey: "Player Name", binding: $vm.playerName, prompt: "Enter player name")
                        CustomSlider(binding: $vm.playerLevel, number:vm.playerLevel, title: "Player Level", limit: 20)
                        HStack {
                            Text("Select Race")
                                .padding(.horizontal)
                            Spacer()
                            Picker("Select PC Race", selection: $vm.playerRaceType) {
                                ForEach(RaceType.allCases, id: \.self) { option in
                                    Text(option.rawValue)
                                }
                            }
                            .accentColor(.creamDungeon)
                            .pickerStyle(.menu)
                        }
                        .onChange(of: vm.playerRaceType) { newValue in
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
                    CarouselClasses()
                        .padding(.bottom)
                    VStack(spacing: 30) {
                        HStack {
                            Text("Alignement")
                                .padding(.horizontal)
                            Spacer()
                            Picker("Select PC Race", selection: $vm.playerAlignment) {
                                ForEach(AlignmentType.allCases, id: \.self) { option in
                                    Text(option.rawValue)
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
                                Text("Player Inspiration")
                            }
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
                        CustomMultipleTextField(title: "Notes", titleKey: "Player Notes", binding: $vm.playerNotes)
                        Button {
                            //
                        } label: {
                            Text("Create Player")
                        }
                        .padding()
                        .background {
                            Color.mainDungeon
                        }
                        .cornerRadius(10)
                    }
                    .padding(.horizontal, 30)
                    .foregroundStyle(.white)
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    CreatePlayerView()
}
