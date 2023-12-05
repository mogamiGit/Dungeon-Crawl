//
//  DetailNpcView.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 3/12/23.
//

import SwiftUI

struct DetailNpcView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) private var presentationMode
    
    @Bindable var npc: NPC
    @State var showDeleteConfirmation = false
    @State var npcEdit: NPC?
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.bgDungeon.ignoresSafeArea()
                ScrollView {
                    VStack(spacing: 40) {
                        VStack {
                            if let imageData = npc.imageData {
                                Image(uiImage: UIImage(data: imageData)!)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 200)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    .padding(0)
                            }
                            Text(npc.name)
                                .font(.largeTitle)
                        }
                        VStack {
                            HStack(alignment: .top,spacing: 10) {
                                SquareFlexibleModule(useVStack: true, colorBackground: .black) {
                                    Text("Occupation")
                                        .font(.caption2)
                                    Text(npc.occupation)
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                        .lineLimit(2)
                                }
                                SquareFlexibleModule(useVStack: true, colorBackground: .black) {
                                    Text("Race")
                                        .font(.caption2)
                                    Text(npc.raceType)
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                }
                            }
                            SquareFlexibleModule(useVStack: false, colorBackground: Color.accentDungeon.opacity(0.4)) {
                                Image("location")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 18)
                                    .foregroundStyle(Color.secondaryDungeon)
                                Text(npc.location)
                            }
                            HStack(spacing: 10) {
                                SquareFlexibleModule(useVStack: true, colorBackground: Color.secondaryDungeon.opacity(0.7)) {
                                    Text("\(npc.age)")
                                        .font(.title)
                                    Text("years")
                                        .font(.caption)
                                }
                                SquareFlexibleModule(useVStack: false, colorBackground: Color.secondaryDungeon.opacity(0.2)) {
                                    Image(npc.alignment.rawValue)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 22)
                                    Text(npc.alignment.rawValue)
                                        .font(.caption)
                                }
                            }
                        }
                        VStack(spacing: 30) {
                            CustomNotes(title: "Appearance", description: npc.appearance)
                            CustomNotes(title: "Background", description: npc.background)
                            CustomNotes(title: "Legacy", description: npc.legacy)
                            CustomNotes(title: "Value", description: npc.value)
                            CustomNotes(title: "Beliefs", description: npc.beliefs)
                            if let notes = npc.notes, !notes.isEmpty {
                                CustomNotes(title: "Notes", description: notes)
                            }
                        }
                        HStack {
                            Button {
                                showDeleteConfirmation.toggle()
                            } label: {
                                HStack {
                                    Image(systemName: "xmark.square.fill")
                                        .foregroundStyle(Color.mainDungeon)
                                        .font(.title2)
                                    Text("Delete NPC")
                                }
                            }
                            .padding(.bottom, 20)
                            Spacer()
                        }
                    }
                    .padding(.top)
                    .padding(Constant.containerHPadding)
                }
            }
            .foregroundStyle(.white)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        npcEdit = npc
                    }, label: {
                        Image("edit")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20)
                            .foregroundStyle(.white)
                    })
                }
            }
            .alert("¿Are you sure you want to delete \(npc.name)", isPresented: $showDeleteConfirmation, actions: {
                Button("Delete", role: .destructive) {
                    withAnimation {
                        deleteNPC(npc)
                    }
                }
                Button("Cancel", role: .cancel) { }
            })
        }
    }
    
    private func deleteNPC(_ npc: NPC) {
        context.delete(npc)
        do {
            try context.save()
            presentationMode.wrappedValue.dismiss()
        } catch {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    DetailNpcView(npc: .exampleNPC())
}
