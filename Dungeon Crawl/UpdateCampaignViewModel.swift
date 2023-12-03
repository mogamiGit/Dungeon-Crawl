//
//  UpdateCampaignViewModel.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 9/11/23.
//

import SwiftUI

@Observable
final class UpdateCampaignViewModel {
    var updatedCampaignName = ""
    var updatedCampaignLocation = ""
    var updatedCampaignLevel = 0
    
    func fetchDataCampaign(campaign: Campaign) {
        updatedCampaignName = campaign.name
        updatedCampaignLocation = campaign.location
        updatedCampaignLevel = campaign.level
    }
    
    func isFormValidate() -> Bool {
        if updatedCampaignName.isEmpty || updatedCampaignLocation.isEmpty || updatedCampaignLevel == 0 {
            return false
        }
        return true
    }
}
