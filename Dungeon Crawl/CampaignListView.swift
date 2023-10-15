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
    @Environment(\.modelContext) private var context
    @Query(sort: \Campaign.name, order: .forward, animation: .easeOut) private var campaigns: [Campaign]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.secondaryDungeon.ignoresSafeArea().opacity(0.5)
                VStack {
                    if campaigns.isEmpty {
                        Text("No available campaigns")
                    } else {
                        List {
                            ForEach(campaigns) { campaign in
                                NavigationLink {
                                    DetailCampaignView(campaign: campaign)
                                } label: {
                                    CampaignCell(campaign: campaign)
                                }
                            }
                            .onDelete { indexSet in
                                for index in indexSet {
                                    context.delete(campaigns[index])
                                }
                            }
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                        }
                        .listStyle(.plain)
                        .scrollContentBackground(.hidden)
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
        }
        .fullScreenCover(isPresented: $vm.showCampaignCreation, content: {
            CreateCampaignView()
        })
    }
}

#Preview {
    CampaignListView()
        .modelContainer(for: Campaign.self)
}
