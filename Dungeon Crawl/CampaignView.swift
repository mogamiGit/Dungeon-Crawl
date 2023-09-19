//
//  CampaignView.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 19/9/23.
//

import SwiftUI

struct CampaignView: View {
    @State var vm = CampaignViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if vm.campaignsLogic.campaigns.isEmpty {
                    Text("No available campaigns")
                } else {
                    List(vm.campaignsLogic.campaigns) { campaign in
                        Text(campaign.name)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        vm.campaignsLogic.showCampaignForm()
                    } label: {
                        Text("Create Campaign")
                    }
                }
            }
            .navigationTitle("My Campaigns")
        }
        .sheet(isPresented: $vm.campaignsLogic.showCampaignCreation, content: {
            CreateCampaignView(vm: vm)
        })
    }
}

#Preview {
    CampaignView()
}
