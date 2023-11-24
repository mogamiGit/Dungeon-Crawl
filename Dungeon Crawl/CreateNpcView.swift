//
//  CreateNpcView.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 13/11/23.
//

import SwiftUI
import SwiftData

struct CreateNpcView: View {
    @Environment(\.dismiss) var dismiss
    @State var vm = CreateNpcViewModel()
    @Bindable var npc: NPC
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.bgDungeon.ignoresSafeArea()
                ScrollView(.horizontal) {
                    LazyHStack {
                        VStack(alignment: .leading, spacing: 30) {
                            MainTextField(titleKey: "Name", binding: $vm.npcName, prompt: "Name")
                            HStack {
                                MainTextField(titleKey: "Racetype", binding: $vm.npcRaceType, prompt: "Racetype")
                                MainTextField(titleKey: "Age", binding: $vm.npcAge, prompt: "Age")
                                    .frame(width: 90)
                                    .keyboardType(.numberPad)
                            }
                            HStack {
                                MainTextField(titleKey: "Occupation", binding: $vm.npcOccupation, prompt: "Occupation")
                                MainTextField(titleKey: "Location", binding: $vm.npcLocation, prompt: "Location")
                            }
                            CustomMultipleTextField(title: "Background", titleKey: "Background", promptText: "Enter Background", binding: $vm.npcBackground)
                            HStack {
                                Text("Alignement")
                                    .padding(.horizontal)
                                Spacer()
                                Picker("Select Alignment", selection: $vm.npcAlignment) {
                                    ForEach(AlignmentNPC.allCases, id: \.self) { item in
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
                            CustomMultipleTextField(title: "Appearance", titleKey: "Appearance", promptText: "Enter Appearance", binding: $vm.npcAppearance)
                        }
                        .padding(.horizontal)
                        .containerRelativeFrame(.horizontal)
                        VStack(alignment: .leading, spacing: 30) {
                            CustomMultipleTextField(title: "Legacy", titleKey: "Legacy", promptText: "Enter Legacy", binding: $vm.npcLegacy, description: "Example: This NPC dreams of some truly ridiculous schemes.")
                            CustomMultipleTextField(title: "Value", titleKey: "Value", promptText: "Enter Value", binding: $vm.npcValue, description: "Example: Values solitude when they study, reveling in uninterrupted hours with their books.")
                            CustomMultipleTextField(title: "Beliefs", titleKey: "Beliefs", promptText: "Enter Beliefs", binding: $vm.npcBeliefs, description: "Example: Believes in the keeping knowledge alive not onlyin books")
                        }
                        .padding(.horizontal)
                        .containerRelativeFrame(.horizontal)
                    }
                    .scrollTargetLayout()
                }
                .contentMargins(.horizontal, 10)
                .scrollTargetBehavior(.viewAligned)
                .foregroundStyle(.white)
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
}

#Preview {
    CreateNpcView(npc: NPC.exampleNPC())
}
