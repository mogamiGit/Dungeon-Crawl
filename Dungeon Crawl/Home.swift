//
//  Home.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 18/11/23.
//

import SwiftUI

struct Home: View {
    var body: some View {
        TabView {
            Group {
                CampaignListView()
                    .tabItem {
                        Image(systemName: "pencil.and.scribble")
                        Text("Campaigns")
                    }
                    .tag(1)
                NpcListView()
                    .tabItem {
                        VStack {
                            Image(systemName: "person.2.fill")
                            Text("NPCs")
                        }
                    }
                    .tag(2)
            }
            .toolbarBackground(Color.black
                               , for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
        }
        .accentColor(Color.accentDungeon)
    }
}

#Preview {
    Home()
}
