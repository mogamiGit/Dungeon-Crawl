//
//  CampaignListViewModel.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 20/9/23.
//

import Foundation

@Observable
final class CampaignListViewModel {
    var campaignLogic: CampaignLogic
    var showCampaignCreation = false
    
    init(campaignLogic: CampaignLogic = .shared) {
        self.campaignLogic = campaignLogic
    }
}
