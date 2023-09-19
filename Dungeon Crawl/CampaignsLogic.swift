//
//  CampaignsLogic.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 19/9/23.
//

import SwiftUI

@Observable
final class CampaignsLogic {
    static let shared = CampaignsLogic()
    
    let repository: RepositoryProtocol
    
    var campaignName = ""
    var campaigns: [CampaignModel]
    var showCampaignCreation = false
    
    init(repository: RepositoryProtocol = CampaignRepository()) {
        self.repository = repository
        do {
            self.campaigns = try repository.loadCampaigns()
        } catch {
            print(error)
            self.campaigns = []
        }
    }
    
    func saveCampaign() {
        let newCampaign = CampaignModel(name: campaignName)
        
        campaigns.append(newCampaign)
        try? repository.saveCampaigns(campaigns)
        campaignName = ""
    }
    
    func getCampaigns() {
        do {
            campaigns = try repository.loadCampaigns()
        } catch {
            campaigns = []
        }
    }
    
    func showCampaignForm() {
        showCampaignCreation.toggle()
    }
}

