//
//  RepositoryPreview.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 24/9/23.
//

import Foundation
import SwiftData


@MainActor
class CampaignDataController {
    static let previewCampaign: ModelContainer = {
        do {
            let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
            let container = try ModelContainer(for: Campaign.self, Player.self, configurations: configuration)
            
            Task { @MainActor in
                let player = Player.test
                let test = Campaign.test
                let context = ModelContext(container)
                context.insert(test)
            }
            return container
        } catch {
            fatalError("Failed to create container: \(error.localizedDescription)")
        }
    }()
}

extension Campaign {
    static let test = Campaign(name: "Magic DnD Trip",
                        location: "Castle Darkhold",
                        level: 4,
                               players: [Player.test])
}

extension Player {
    static let test = Player(nameCharacter: "Jhon Doe",
                             namePlayer: "Sefard The Scapist",
                              level: 5,
                             raceType: RaceType.human,
                             classType: ClassType.wizard,
                              age: 25,
                             alignment: AlignmentType.chaoticgood,
                              ideals: "Justice and Freedom",
                              defects: "Impatient",
                              inspiration: true,
                              notes: "Has a pet owl named Hoot")
}
