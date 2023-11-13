//
//  PlayerCell.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 22/10/23.
//

import SwiftUI

struct PlayerCell: View {
    @Bindable var player: Player
    @State var vm = CreatePlayerViewModel()
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            VStack {
                vm.getTypeImage(playerClass:player.classType)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .foregroundStyle(Color.secondaryDungeon)
                    .padding(15)
                    .background {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.white.opacity(0.1))
                    }
            }
            VStack(alignment: .leading) {
                Text(player.nameCharacter)
                    .font(.title2)
                    .lineLimit(2)
                    .fontWeight(.bold)
                Text(player.classType.rawValue)
                    .font(.callout)
                    .padding(.bottom, 10)
                HStack {
                    Image(systemName: "person.fill")
                        .foregroundStyle(Color.accentDungeon)
                    Text(player.namePlayer)
                        .font(.callout)
                        .foregroundStyle(.gray)
                }
            }
            Spacer()
        }
        .frame(maxHeight: 140)
    }
}

#Preview {
    PlayerCell(player: .test)
}
