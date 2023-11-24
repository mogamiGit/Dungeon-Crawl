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
                        Image(systemName: "1.circle")
                        Text("Campaigns")
                    }
                    .tag(1)
                NpcView()
                    .tabItem {
                        VStack {
                            Image(systemName: "2.circle")
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
