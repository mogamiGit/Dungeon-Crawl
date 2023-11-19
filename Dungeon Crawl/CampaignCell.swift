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
                        .frame(width: 28)
                        .foregroundStyle(Color.secondaryDungeon)
                    Text(campaign.location)
                }
                .font(.title3)
            }
            HStack {
                Text("Lv.\(campaign.level)")
                    .font(.title3)
                    .foregroundStyle(Color.secondaryDungeon)
                Spacer()
                HStack {
                    if !(campaign.players.count == 0) {
                        HStack(spacing: 7) {
                            Image("D20.empty")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20)
                                .foregroundStyle(Color.accentDungeon)
                            Text("\(campaign.players.count)")
                        }
                    }
                    if !(campaign.encounters.count == 0) {
                        HStack(spacing: 3) {
                            Image("swords")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20)
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
            RoundedRectangle(cornerRadius: 10)
            .fill(Color.bgDungeon)
        }
    }
}

#Preview {
    CampaignCell(campaign: Campaign.exampleCampaign())
        .modelContainer(PreviewSampleData.container)
}
