//
//  DetailMonsterView.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 20/2/24.
//

import SwiftUI

struct DetailMonsterView: View {
    @State var vm: DetailMonsterViewModel
    
    var body: some View {
        if let monster = vm.monster {
            Text(monster.name)
            Text(monster.alignment)
        } else {
            Text("No ha cargado")
        }
    }
}

#Preview {
    DetailMonsterView(vm: DetailMonsterViewModel(selectedMonster: "aboleth"))
}
