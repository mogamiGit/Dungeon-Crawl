//
//  NpcCell.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 22/11/23.
//

import SwiftUI

struct NpcCell: View {
    @Bindable var npc: NPC
    let bgColor: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ZStack(alignment: .trailing) {
                Image("Half-orc")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .background(.gray)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay {
                        Circle()
                            .stroke(lineWidth: 5.0)
                            .fill(bgColor)
                    }
                    .offset(y: -70)
                VStack(alignment: .leading) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(npc.name)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .lineLimit(2)
                        Text(npc.occupation)
                            .font(.caption)
                            .foregroundStyle(Color.secondaryDungeon)
                    }
                    Spacer()
                    HStack(spacing: 5) {
                        Image("location")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18)
                            .foregroundStyle(Color.secondaryDungeon)
                        Text(npc.location)
                            .font(.caption)
                            .lineLimit(1)
                        Spacer()
                    }
                    .font(.headline)
                }
                .padding(.top, 20)
            }
            
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .frame(height: 120)
        .padding(20)
        .foregroundStyle(.white)
        .background {
            RoundedRectangle(cornerRadius: 20)
                .fill(bgColor)
        }
    }
}

#Preview {
    NpcCell(npc: NPC.exampleNPC(), bgColor: .black)
}
