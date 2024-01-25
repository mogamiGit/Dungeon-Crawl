//
//  CreateCampaignViewModel.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 19/9/23.
//

import SwiftUI
import SwiftData

@Observable
final class CreateCampaignViewModel {
    var campaignName = ""
    var campaignLocation = ""
    var campaignLevel = 0
    
    func isFormValidate() -> Bool {
        if campaignName.isEmpty || campaignLocation.isEmpty || campaignLevel == 0 {
            return false
        }
        return true
    }
}
