//
//  CreateNpcView.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 13/11/23.
//

import SwiftUI

struct CreateNpcView: View {
    @Environment(\.dismiss) var dismiss
//    @Bindable var npc: NPC
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.bgDungeon.ignoresSafeArea()
                ScrollView {
                    VStack(alignment: .leading) {
                        Spacer()
                        VStack(spacing: 30) {
                            
                        }
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
}

#Preview {
    CreateNpcView()
}
