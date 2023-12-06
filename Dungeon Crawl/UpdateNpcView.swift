//
//  UpdateNpcView.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 6/12/23.
//

import SwiftUI

struct UpdateNpcView: View {
    @Environment(\.dismiss) private var dismiss
    
    @Bindable var npc: NPC
    @State var vm = UpdateNpcViewModel()
    @State private var scrollPosition: Int? = 0
    @State private var photoData: Data?
    
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
                                .padding(.top, 10)
                                .padding(.bottom, 20)
                            })
                            .opacity(scrollPosition == 0 ? 0.0 : 1.0)
                            Spacer()
                            if scrollPosition == 2 {
                                withAnimation {
                                    Button(action: {
                                        if vm.isFormValidate() {
                                            updateNpc()
                                            dismiss()
                                        }
                                    }, label: {
                                        HStack {
                                            Image(systemName: "checkmark")
                                            Text("Save NPC")
                                        }
                                    })
                                    .buttonStyle(DungeonTopButton(isButtonEnabled: vm.isFormValidate()))
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
                                VStack {
                                    PhotoPicker(selectedPhotoData: $photoData, iconName: "square.and.pencil")
                                    VStack(spacing: Constant.spaceBetweenElements) {
                                        MainTextField(titleKey: "Name", binding: $vm.updateNpcName, prompt: "Name*")
                                        HStack {
                                            MainTextField(titleKey: "Racetype", binding: $vm.updateNpcRaceType, prompt: "Racetype*")
                                            MainTextField(titleKey: "Age", binding: $vm.updateNpcAge, prompt: "Age*")
                                                .frame(width: 90)
                                                .keyboardType(.numberPad)
                                        }
                                        HStack {
                                            MainTextField(titleKey: "Occupation", binding: $vm.updateNpcOccupation, prompt: "Occupation*")
                                            MainTextField(titleKey: "Location", binding: $vm.updateNpcLocation, prompt: "Location*")
                                        }
                                    }
                                    
                                }
                                .padding(.horizontal)
                                .containerRelativeFrame(.horizontal)
                                .id(0)
                                VStack(alignment: .leading, spacing: Constant.spaceBetweenElements) {
                                    CustomMultipleTextField(title: "Background*", titleKey: "Background", promptText: "Enter Background", binding: $vm.updateNpcBackground)
                                    HStack {
                                        Text("Alignement")
                                            .padding(.horizontal)
                                        Spacer()
                                        Picker("Select Alignment", selection: $vm.updateNpcAlignment) {
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
                                    CustomMultipleTextField(title: "Appearance*", titleKey: "Appearance", promptText: "Enter Appearance", binding: $vm.updateNpcAppearance)
                                    CustomMultipleTextField(title: "Notes", titleKey: "Notes", promptText: "Enter notes", binding: $vm.updateNpcBeliefs)
                                }
                                .padding(.horizontal)
                                .containerRelativeFrame(.horizontal)
                                .id(1)
                                VStack(alignment: .leading, spacing: Constant.spaceBetweenElements) {
                                    CustomMultipleTextField(title: "Legacy*", titleKey: "Legacy", promptText: "Enter Legacy", binding: $vm.updateNpcLegacy, description: "Example: This NPC dreams of some truly ridiculous schemes.")
                                    CustomMultipleTextField(title: "Value*", titleKey: "Value", promptText: "Enter Value", binding: $vm.updateNpcValue, description: "Example: Values solitude when they study, reveling in uninterrupted hours with their books.")
                                    CustomMultipleTextField(title: "Beliefs*", titleKey: "Beliefs", promptText: "Enter Beliefs", binding: $vm.updateNpcBeliefs, description: "Example: Believes in the keeping knowledge alive not onlyin books")
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
                    VStack(alignment: .center) {
                        Text("Fill in all required fields in order to complete (*)")
                            .font(.caption)
                        .foregroundStyle(.gray)
                    }
                    .padding(.horizontal, Constant.containerHPadding)
                }
                .onAppear {
                    vm.fetchDataNpc(npc: npc)
                    photoData = npc.imageData
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
    
    func updateNpc() {
        npc.imageData = photoData
        npc.name = vm.updateNpcName
        npc.raceType = vm.updateNpcRaceType
        npc.age = Int(vm.updateNpcAge) ?? 1
        npc.occupation = vm.updateNpcOccupation
        npc.location = vm.updateNpcLocation
        npc.background = vm.updateNpcBackground
        npc.alignment = vm.updateNpcAlignment
        npc.appearance = vm.updateNpcAppearance
        npc.notes = vm.updateNpcNotes
        npc.legacy = vm.updateNpcLegacy
        npc.value = vm.updateNpcValue
        npc.beliefs = vm.updateNpcBeliefs
    }
}

#Preview {
    UpdateNpcView(npc: .exampleNPC())
}
