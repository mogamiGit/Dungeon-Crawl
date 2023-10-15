//
//  CreateCampaignView.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 19/9/23.
//

import SwiftUI
import SwiftData

struct CreateCampaignView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    
    @State var vm = CreateCampaignViewModel()
    
    var body: some View {
        ZStack {
            Color.bgDungeon.ignoresSafeArea()
            VStack(spacing: 30) {
                MainTextField(titleKey: "Campaign Name", binding: $vm.campaignName, prompt: "Enter campaign name")
                MainTextField(titleKey: "Campaign Location", binding: $vm.campaignLocation, prompt: "Enter location")
                CustomSlider(binding: $vm.campaignLevel, number: vm.campaignLevel, title: "Campaign Level", limit: 20)
                Button {
                    addCampaign()
                    dismiss()
                } label: {
                    Text("Create Campaign")
                }
                .padding()
                .background {
                    Color.mainDungeon
                }
                .cornerRadius(10)
            }
            .padding(30)
            .foregroundStyle(.white)
        }
    }
    
    private func addCampaign() {
        let campaign = Campaign(name: vm.campaignName, location: vm.campaignLocation, level: vm.campaignLevel, players: [])
        
        context.insert(campaign)
    }
    
}

#Preview {
    CreateCampaignView()
        .modelContainer(for: Campaign.self, inMemory: true)
}
