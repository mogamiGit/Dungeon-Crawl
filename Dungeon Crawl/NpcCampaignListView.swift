//
//  NpcCampaignListView.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 12/11/23.
//

import SwiftUI
import SwiftData

struct NpcCampaignListView: View {
    @Bindable var campaign: Campaign
    @Query(sort: \NPC.name, order: .reverse, animation: .bouncy) var npcs: [NPC]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(), count: 2),spacing: 10) {
                    //Filter only NPCs == Campaign
                    ForEach(npcs) { npc in
                        NpcCell(npc: npc, bgColor: Color.gray)
                            .padding(.top)
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    NpcCampaignListView(campaign: Campaign.exampleCampaign())
        .modelContainer(PreviewSampleData.container)
}
