//
//  CampaignRepository.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 19/9/23.
//

import Foundation

protocol RepositoryProtocol {
    var bundleURL: URL { get }
    var docURL: URL { get }
    
    func saveCampaigns(_ campaigns:[CampaignModel]) throws
    func loadCampaigns() throws -> [CampaignModel]
}

extension RepositoryProtocol {
    func saveCampaigns(_ campaigns: [CampaignModel]) throws {
        let data = try JSONEncoder().encode(campaigns)
        try data.write(to: docURL, options: .atomic)
        print(docURL)
    }
    
    func loadCampaigns() throws -> [CampaignModel] {
        var url = docURL
        
        if !FileManager.default.fileExists(atPath: docURL.path()) {
            url = bundleURL
        }
        
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode([CampaignModel].self, from: data)
    }
}

struct CampaignRepository: RepositoryProtocol {
    var bundleURL: URL {
        Bundle.main.url(forResource: "CampaignTest", withExtension: "json")!
    }
    
    var docURL: URL {
        URL.documentsDirectory.appending(path: "CampaignTest.json")
    }
}
