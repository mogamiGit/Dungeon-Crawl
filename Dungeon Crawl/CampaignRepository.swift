//
//  CampaignRepository.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 19/9/23.
//

import Foundation

protocol RepositoryProtocol {
    var docURL: URL { get }
    
    func saveCampaigns(_ campaigns:[CampaignModel]) throws
    func loadCampaigns() throws -> [CampaignModel]
}

struct CampaignRepository: RepositoryProtocol {
    var docURL: URL {
        URL.documentsDirectory.appending(path: "myCampaigns.json")
    }
    
    func saveCampaigns(_ campaigns: [CampaignModel]) throws {
        let data = try JSONEncoder().encode(campaigns)
        try data.write(to: docURL, options: .atomic)
        print(docURL)
    }
    
    func loadCampaigns() throws -> [CampaignModel] {
        if !FileManager.default.fileExists(atPath: docURL.path()) {
            return []
        }
        
        let data = try Data(contentsOf: docURL)
        return try JSONDecoder().decode([CampaignModel].self, from: data)
    }
}
