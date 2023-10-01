//
//  CampaignCell.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 20/9/23.
//

import SwiftUI

struct CampaignCell: View {
    @Bindable var campaign: CampaignModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            VStack(alignment: .leading, spacing: 10) {
                Text(campaign.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .lineLimit(2)
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                    Text(campaign.location)
                }
                .font(.title3)
            }
            HStack {
                Text("Lv.\(campaign.level)")
                    .font(.title3)
                Spacer()
                HStack {
                    HStack(spacing: 3) {
                        Image(systemName: "person.2.fill")
                        Text("\(campaign.players.count)")
                    }
                    if !(campaign.encounters?.count == 0) {
                        HStack(spacing: 3) {
                            Image(systemName: "bolt.shield.fill")
                            Text("\(campaign.encounters!.count)")
                        }
                    }
                }
                .fontWeight(.bold)
            }
        }
        .padding(16)
    }
}

#Preview {
    CampaignCell(campaign: .test)
}
