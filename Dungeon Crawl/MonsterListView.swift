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
        List {
            ForEach(vm.monsters) { monster in
                Text(monster.name)
            }
        }
    }
}

#Preview {
    MonsterListView()
}
