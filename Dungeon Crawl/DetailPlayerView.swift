//
//  DetailPlayerView.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 2/11/23.
//

import SwiftUI

struct DetailPlayerView: View {
    @Bindable var player: Player
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode
    @State var showDeleteConfirmation = false
    @State var playerEdit: Player?
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.bgDungeon.ignoresSafeArea()
                VStack {
                    Text(player.nameCharacter)
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
                        .foregroundStyle(Color.mainDungeon)
                    }
                }
            }
            .alert("¿Are you sure you want to delete \(player.nameCharacter)", isPresented: $showDeleteConfirmation, actions: {
                Button("Delete", role: .destructive) {
                    Task {
                        await MainActor.run {
                            context.delete(player)
                            try? context.save()
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
                Button("Cancel", role: .cancel) { }
            })
        }
    }
}

#Preview {
    DetailPlayerView(player: Player.examplePlayer2())
}
