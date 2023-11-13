//
//  NpcCampaignListView.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 12/11/23.
//

import SwiftUI
import SwiftData

struct NpcCampaignListView: View {
    //Filter only NPCs == Campaign
    @Query(sort: \NPC.name, order: .reverse, animation: .bouncy) var npcs: [NPC]
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Text("NPC")
        }
    }
}

#Preview {
    NpcCampaignListView()
        .modelContainer(PreviewSampleData.container)
}
