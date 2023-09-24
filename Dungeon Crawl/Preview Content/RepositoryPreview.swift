//
//  RepositoryPreview.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 24/9/23.
//

import Foundation

struct RepositoryPreview: RepositoryProtocol {
    var bundleURL: URL {
        Bundle.main.url(forResource: "CampaignTest", withExtension: "json")!
    }
    
    var docURL: URL {
        URL.documentsDirectory.appending(path: "CampaignTest.json")
    }
}

extension CampaignListViewModel {
    static let preview = CampaignListViewModel(campaignsLogic: CampaignsLogic(repository: RepositoryPreview()))
}

extension CampaignModel {
    static let test = CampaignModel(name: "Magic DnD Trip", location: "Castle Darkhold", level: 4, players: [Player(name: "Sefard The Scapist", level: "5", raceType: "Human", classType: "Wizard", age: 25, alignment: "Lawful Good", ideals: "Justice and Freedom", defects: "Impatient", inspiration: true, notes: "Has a pet owl named Hoot")], NPCs: [], encounters: [])
}
