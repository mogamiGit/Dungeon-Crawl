//
//  CreateNpcView.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 13/11/23.
//

import SwiftUI
import SwiftData

struct CreateNpcView: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    @Query(sort: \Campaign.name, order: .forward) private var campaigns: [Campaign]
    @State var vm = CreateNpcViewModel()
    @State private var scrollPosition: Int? = 0
    @State private var isChecked = false
    @State private var checkedCampaigns: [String] = []
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.bgDungeon.ignoresSafeArea()
                VStack(alignment: .leading) {
                    ScrollViewReader { proxy in
                        HStack {
                            Button(action: {
                                withAnimation {
                                    scrollPosition = scrollPosition == nil ? 0 : (scrollPosition! - 1)
                                    proxy.scrollTo(scrollPosition)
                                }
                            }, label: {
                                HStack {
                                    Image(systemName: "arrow.left")
                                    Text("Prev")
                                }
                                .font(.callout)
                                .padding(.vertical, 10)
                            })
                            .opacity(scrollPosition == 0 ? 0.0 : 1.0)
                            Spacer()
                            if scrollPosition == 2 {
                                withAnimation {
                                    Button(action: {
                                        addNpc()
                                        dismiss()
                                    }, label: {
                                        HStack {
                                            Image(systemName: "plus")
                                            Text("Create NPC")
                                        }
                                        .font(.subheadline)
                                        .foregroundStyle(.white)
                                        .padding(10)
                                        .background {
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(lineWidth: 1.0)
                                                .fill(Color.accentDungeon)
                                        }
                                    })
                                }
                            } else {
                                withAnimation(.bouncy) {
                                    Button(action: {
                                        withAnimation {
                                            scrollPosition = scrollPosition == nil ? 0 : (scrollPosition! + 1)
                                            proxy.scrollTo(scrollPosition)
                                        }
                                    }, label: {
                                        HStack {
                                            Text("Next")
                                            Image(systemName: "arrow.right")
                                        }
                                        .font(.callout)
                                        .padding(.vertical, 10)
                                    })
                                }
                            }
                        }
                        .padding(.top, 10)
                        .padding(.horizontal, Constant.containerHPadding - 5)
                        ScrollView(.horizontal) {
                            LazyHStack(alignment: .top) {
                                VStack(spacing: Constant.spaceBetweenElements) {
                                    Circle()
                                        .fill(.gray)
                                        .frame(width: 150)
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
                                    DisclosureGroup {
                                        ScrollView {
                                            ForEach(campaigns) { campaign in
                                                HStack() {
                                                    Toggle(isOn: $isChecked) {
                                                        Text(campaign.name)
                                                    }
                                                    .onChange(of: isChecked, initial: false) {
                                                        //
                                                    }
                                                    .padding()
                                                    .toggleStyle(CheckboxToggleStyle())
                                                    Spacer()
                                                }
                                            }
                                        }
                                    } label: {
                                        Text("Campaigns associated")
                                    }
                                    
                                }
                                .padding(.horizontal)
                                .containerRelativeFrame(.horizontal)
                                .id(0)
                                VStack(alignment: .leading, spacing: Constant.spaceBetweenElements) {
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
                                .id(1)
                                VStack(alignment: .leading, spacing: Constant.spaceBetweenElements) {
                                    CustomMultipleTextField(title: "Legacy", titleKey: "Legacy", promptText: "Enter Legacy", binding: $vm.npcLegacy, description: "Example: This NPC dreams of some truly ridiculous schemes.")
                                    CustomMultipleTextField(title: "Value", titleKey: "Value", promptText: "Enter Value", binding: $vm.npcValue, description: "Example: Values solitude when they study, reveling in uninterrupted hours with their books.")
                                    CustomMultipleTextField(title: "Beliefs", titleKey: "Beliefs", promptText: "Enter Beliefs", binding: $vm.npcBeliefs, description: "Example: Believes in the keeping knowledge alive not onlyin books")
                                }
                                .padding(.horizontal)
                                .containerRelativeFrame(.horizontal)
                                .id(2)
                            }
                            .scrollTargetLayout()
                        }
                        .scrollPosition(id: $scrollPosition)
                        .scrollIndicators(.hidden)
                        .contentMargins(.horizontal, 10)
                        .scrollTargetBehavior(.viewAligned)
                        .foregroundStyle(.white)
                    }
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
    
    private func selectCampaign(name: String) {
        if isChecked {
            checkedCampaigns.append(name)
        } else {
            checkedCampaigns = checkedCampaigns.filter { $0 != name }
        }
    }
    
    private func addNpc() {
        let npc = NPC(imageName: "", name: vm.npcName, raceType: vm.npcRaceType, age: Int(vm.npcAge) ?? 0, occupation: vm.npcOccupation, location: vm.npcLocation, background: vm.npcBackground, alignment: vm.npcAlignment, appearance: vm.npcAppearance, legacy: vm.npcLegacy, value: vm.npcValue, beliefs: vm.npcBeliefs, selectedCampaigns: [])
        
        context.insert(npc)
    }
}

#Preview {
    CreateNpcView()
        .modelContainer(PreviewSampleData.container)
}
