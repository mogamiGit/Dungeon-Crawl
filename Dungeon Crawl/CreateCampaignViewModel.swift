//
//  CampaignVM.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 19/9/23.
//

import Foundation

@Observable
final class CreateCampaignViewModel {
    var campaignName = ""
    var campaignLocation = ""
    var campaignLevel = 0
    
    var campaignsLogic: CampaignsLogic
    
    var newCampaign: CampaignModel {
        CampaignModel(name: campaignName, location: campaignLocation, level: Int(campaignLevel), players:[])
    }
    
    init(campaignsLogic: CampaignsLogic = .shared) {
        self.campaignsLogic = campaignsLogic
    }
}
