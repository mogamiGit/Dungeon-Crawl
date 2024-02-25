//
//  MonsterListView.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 9/2/24.
//

import SwiftUI

struct MonsterListView: View {
    @State var vm = MonsterListViewModel()
    private let alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.secondaryDungeon.ignoresSafeArea()
                VStack {
                    List {
                        ForEach(alphabet, id: \.self) { character in
                            Section(header: headerSection(title: character)) {
                                ForEach(vm.filterMonsterByCharacter(character: character)) { monster in
                                    NavigationLink {
                                        DetailMonsterView(vm: DetailMonsterViewModel(selectedMonster: monster.index))
                                    } label: {
                                        Text(monster.name)
                                            .font(.title3)
                                            .padding(8)
                                    }
                                }
                            }
                        }
                        .listRowBackground(Color.bgDungeon)
                        .foregroundStyle(.white)
                    }
                    .listStyle(.plain)
                    .navigationTitle("Bestiary")
                    
                }
            }
        }
    }
    
    @ViewBuilder
    func headerSection(title: String) -> some View {
        Text(title)
            .font(.custom("CloisterBlack", size: 30))
            .textCase(.uppercase)
            .foregroundStyle(.black)
    }
}

#Preview {
    MonsterListView()
}
