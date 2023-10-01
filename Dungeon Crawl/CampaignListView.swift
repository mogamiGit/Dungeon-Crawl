//
//  CampaignListView.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 19/9/23.
//

import SwiftUI
import SwiftData

struct CampaignListView: View {
    @State var vm = CampaignListViewModel()
    
    @Environment(\.modelContext) var context
    @Query(sort: \CampaignModel.name, order: .forward, animation: .easeOut)
    private var campaigns: [CampaignModel]
    
    var body: some View {
        NavigationStack {
            VStack {
                if campaigns.isEmpty {
                    Text("No available campaigns")
                } else {
                    List {
                        ForEach(campaigns) { campaign in
                            CampaignCell(campaign: campaign)
                        }
                        .onDelete { indexSet in
                            for index in indexSet {
                                context.delete(campaigns[index])
                            }
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        vm.showCampaignCreation.toggle()
                    } label: {
                        Text("Create Campaign")
                    }
                }
            }
            .navigationTitle("My Campaigns")
        }
        .sheet(isPresented: $vm.showCampaignCreation, content: {
            CreateCampaignView()
        })
    }
}

#Preview {
    CampaignListView()
        .modelContainer(for: CampaignModel.self)
}
