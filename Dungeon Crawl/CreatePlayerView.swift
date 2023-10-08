//
//  CreatePlayerView.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 7/10/23.
//

import SwiftUI

struct CreatePlayerView: View {
    @State var vm = CreatePlayerViewModel()
    @State private var selectedStep = 0
    //con el botón sumo 1 y entonces cambia de pantalla
    
    var body: some View {
        ZStack {
            Color.bgDungeon.ignoresSafeArea()
            ScrollView {
                VStack(spacing: 30) {
                        MainTextField(titleKey: "Player Name", binding: $vm.playerName, prompt: "Enter player name")
                    CustomSlider(binding: $vm.playerLevel, number: vm.playerLevel)
                    }
                    .padding(30)
                .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    CreatePlayerView()
}
