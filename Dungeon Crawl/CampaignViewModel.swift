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
    var campaignsLogic: CampaignsLogic

    var newCampaign: CampaignModel {
        CampaignModel(name: campaignName)
    }
    
    init(campaignsLogic: CampaignsLogic = .shared) {
        self.campaignsLogic = campaignsLogic
    }
}

@Observable
final class CampaignListViewModel {
    var campaignsLogic: CampaignsLogic
    var showCampaignCreation = false

    init(campaignsLogic: CampaignsLogic = .shared) {
        self.campaignsLogic = campaignsLogic
    }
}
