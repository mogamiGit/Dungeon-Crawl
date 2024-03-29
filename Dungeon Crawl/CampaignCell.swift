//
//  CampaignCell.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 20/9/23.
//

import SwiftUI
import SwiftData

struct CampaignCell: View {
    @Bindable var campaign: Campaign
    
    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            VStack(alignment: .leading, spacing: 10) {
                Text(campaign.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .lineLimit(2)
                HStack {
                    Image("location")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                        .foregroundStyle(Color.secondaryDungeon)
                    Text(campaign.location)
                }
                .font(.subheadline)
            }
            HStack {
                Text("Lv.\(campaign.level)")
                    .font(.title3)
                    .foregroundStyle(Color.secondaryDungeon)
                Spacer()
                HStack {
                    if !(campaign.players.count == 0) {
                        HStack(spacing: 7) {
                            Image("person")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 16)
                                .foregroundStyle(Color.accentDungeon)
                            Text("\(campaign.players.count)")
                        }
                    }
                    if !(campaign.encounters.count == 0) {
                        HStack(spacing: 3) {
                            Image("swords")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 16)
                                .foregroundStyle(.white)
                            Text("\(campaign.encounters.count)")
                        }
                    }
                }
                .fontWeight(.bold)
            }
        }
        .padding(20)
        .foregroundStyle(.white)
        .background {
            RoundedRectangle(cornerRadius: 20)
            .fill(Color.bgDungeon)
        }
    }
}

#Preview {
    CampaignCell(campaign: Campaign.exampleCampaign())
        .modelContainer(PreviewSampleData.container)
}
