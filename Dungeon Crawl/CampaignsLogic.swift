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
    var campaigns: [CampaignModel] = []
    
    init(repository: RepositoryProtocol = CampaignRepository()) {
        self.repository = repository
        self.campaigns = (try? repository.loadCampaigns()) ?? []
    }
    
    func saveCampaign(_ campaign: CampaignModel) {
        //TODO: Deberías de comprobar que no haya campaña previa, si es así reemplazarla
        campaigns.append(campaign)
        try? repository.saveCampaigns(campaigns)
    }
    
    func getCampaigns() {
        self.campaigns = (try? repository.loadCampaigns()) ?? []
    }
}

