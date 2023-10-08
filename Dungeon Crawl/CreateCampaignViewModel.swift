//
//  CreateCampaignViewModel.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 19/9/23.
//

import Foundation
import SwiftUI

@Observable
final class CreateCampaignViewModel {
    var campaignName = ""
    var campaignLocation = ""
    var campaignLevel = 0
    
    var createPlayerViewModel: CreatePlayerViewModel
    var campaignLogic: CampaignLogic
    
    var newCampaign: CampaignModel {
        CampaignModel(name: campaignName, location: campaignLocation, level: campaignLevel, players: [createPlayerViewModel.newPlayer])
    }
    
    init(campaignLogic: CampaignLogic = .shared, createPlayerViewModel: CreatePlayerViewModel = .shared ) {
        self.campaignLogic = campaignLogic
        self.createPlayerViewModel = createPlayerViewModel
    }
}
