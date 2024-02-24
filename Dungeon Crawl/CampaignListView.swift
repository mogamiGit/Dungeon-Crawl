//
//  CampaignListView.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 19/9/23.
//

import SwiftUI
import SwiftData

struct CampaignListView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \Campaign.name, order: .forward, animation: .easeOut) private var campaigns: [Campaign]
    @State var showCampaignCreation = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.secondaryDungeon.ignoresSafeArea()
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
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        withAnimation(.easeOut(duration: 1)) {
                            showCampaignCreation.toggle()
                        }
                    } label: {
                        HStack(spacing: 5) {
                            Image(systemName: "plus.square.fill")
                            Text("Add Campaign")
                                .font(.callout)
                        }
                        .foregroundStyle(Color.mainDungeon)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle("My Campaigns")
        }
        .fullScreenCover(isPresented: $showCampaignCreation, content: {
            CreateCampaignView()
        })
    }
}

#Preview {
    CampaignListView()
        .modelContainer(PreviewSampleData.container)
}
