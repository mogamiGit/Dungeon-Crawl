//
//  CampaignListViewModel.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 20/9/23.
//

import Foundation

@Observable
final class CampaignListViewModel {
    var campaignsLogic: CampaignsLogic
    var showCampaignCreation = false
    
    init(campaignsLogic: CampaignsLogic = .shared) {
        self.campaignsLogic = campaignsLogic
    }
}
