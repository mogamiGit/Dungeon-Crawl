//
//  NpcCell.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 22/11/23.
//

import SwiftUI

struct NpcCell: View {
    @Bindable var npc: NPC
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(npc.name)
                    .font(.title3)
                    .fontWeight(.semibold)
                .lineLimit(1)
            }
            HStack(spacing: 5) {
                Image("location")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18)
                    .foregroundStyle(Color.secondaryDungeon)
                Text(npc.location)
                    .font(.callout)
                    .lineLimit(1)
            }
            .font(.headline)
            Text(npc.occupation)
                .font(.caption)
                .foregroundStyle(Color.secondaryDungeon)
        }
        .padding(20)
        .frame(height: 140)
        .frame(minWidth: 0, maxWidth: .infinity)
        .foregroundStyle(.white)
        .background {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.darkDungeon)
        }
    }
}

#Preview {
    NpcCell(npc: NPC.exampleNPC())
}
