//
//  CreateCampaignView.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 19/9/23.
//

import SwiftUI
import SwiftData

struct CreateCampaignView: View {
    @State var vm = CreateCampaignViewModel()
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.bgDungeon.ignoresSafeArea()
            VStack(spacing: 30) {
                MainTextField(titleKey: "Campaign Name", binding: $vm.campaignName, prompt: "Enter campaign name")
                MainTextField(titleKey: "Campaign Location", binding: $vm.campaignLocation, prompt: "Enter location")
                CustomSlider(binding: $vm.campaignLevel, number: vm.campaignLevel, title: "Campaign Level")
                VStack(alignment: .leading) {
                    Text("Players")
                        .font(.title2)
                        .fontWeight(.bold)
                    Button() {
                        //
                    } label: {
                        HStack() {
                            Image(systemName: "person.fill.badge.plus")
                            Text("Add new player")
                            Spacer()
                        }
                        .padding()
                        .background() {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.white).opacity(0.1).ignoresSafeArea()
                        }
                    }
                }
                Button {
//                    let campaign = vm.newCampaign
//                    context.insert(campaign)
                    addCampaigns()
                    dismiss()
                } label: {
                    Text("Create Campaign")
                }
                .padding()
                .background {
                    Color.black
                }
                .cornerRadius(10)
            }
            .padding(30)
            .foregroundStyle(.white)
        }
    }
    
    private func addCampaigns() {
        let campaign = CampaignModel(name: vm.campaignName, location: vm.campaignLocation, level: vm.campaignLevel, players: [])
        
        context.insert(campaign)
    }
    
}

#Preview {
    CreateCampaignView()
        .modelContainer(for: CampaignModel.self, inMemory: true)
}
