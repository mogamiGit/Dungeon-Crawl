//
//  UpdateCampaignView.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 4/11/23.
//

import SwiftUI

struct UpdateCampaignView: View {
    @Environment(\.dismiss) var dismiss
    @Bindable var campaign: Campaign
    @State var vm = UpdateCampaignViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.bgDungeon.ignoresSafeArea()
                VStack(spacing: 30) {
                    MainTextField(titleKey: "Campaign Name", binding: $vm.updatedCampaignName, prompt: "Enter campaign name").foregroundColor(.gray)
                    MainTextField(titleKey: "Campaign Location", binding: $vm.updatedCampaignLocation, prompt: "Enter location")
                    CustomSlider(binding: $vm.updatedCampaignLevel, number: campaign.level, title: "Campaign Level", limit: 20)
                    Button {
                        updateCampaign()
                        dismiss()
                    } label: {
                        Text("Save Campaign")
                    }
                    .padding()
                    .foregroundStyle(.white)
                    .background {
                        Color.mainDungeon
                    }
                    .cornerRadius(10)
                }
                .onAppear {
                    vm.updatedCampaignName = campaign.name
                    vm.updatedCampaignLocation = campaign.location
                    vm.updatedCampaignLevel = campaign.level
                }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "xmark")
                                .foregroundStyle(.white)
                                .padding(8)
                                .background {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.mainDungeon)
                                }
                                .padding(.bottom)
                        }
                        .padding()
                    }
                }
                .padding(30)
                .foregroundStyle(.white)
            }
        }
    }
    
    func updateCampaign() {
        campaign.name = vm.updatedCampaignName
        campaign.location = vm.updatedCampaignLocation
        campaign.level = vm.updatedCampaignLevel
    }
}

#Preview {
    UpdateCampaignView(campaign: Campaign.exampleCampaign())
}
