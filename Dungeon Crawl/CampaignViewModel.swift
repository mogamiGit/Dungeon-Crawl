//
//  CampaignVM.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 19/9/23.
//

import Foundation

@Observable
final class CampaignViewModel {
    var campaignsLogic: CampaignsLogic
    
    init(campaignsLogic: CampaignsLogic = .shared) {
        self.campaignsLogic = campaignsLogic
    }
}
