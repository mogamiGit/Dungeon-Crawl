//
//  MonsterListView.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 9/2/24.
//

import SwiftUI

struct MonsterListView: View {
    @State var vm = MonsterListViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.secondaryDungeon.ignoresSafeArea()
                VStack {
                    List {
                        ForEach(vm.monsters) { monster in
                            NavigationLink {
                                DetailMonsterView(vm: DetailMonsterViewModel(selectedMonster: monster.index))
                            } label: {
                                Text(monster.name)
                            }
                        }
                    }
                    .listStyle(.plain)
                    .padding(.top, 20)
                }
            }
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle("Bestiary")
        }
    }
}

#Preview {
    MonsterListView()
}
