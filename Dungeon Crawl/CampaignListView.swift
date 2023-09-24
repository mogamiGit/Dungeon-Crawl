//
//  CampaignListView.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 19/9/23.
//

import SwiftUI

struct CampaignListView: View {
    @State var vm = CampaignListViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if vm.campaignsLogic.campaigns.isEmpty {
                    Text("No available campaigns")
                } else {
                    List(vm.campaignsLogic.campaigns) { campaign in
                        CampaignCell(campaign: campaign)
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
    CampaignListView(vm: .preview)
}
