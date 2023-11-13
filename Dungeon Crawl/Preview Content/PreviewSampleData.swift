//
//  RepositoryPreview.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 24/9/23.
//

import Foundation
import SwiftData

actor PreviewSampleData {
    @MainActor
    static var container: ModelContainer = {
        do {
            let schema = Schema([Campaign.self, Player.self, NPC.self])
            let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
            let container = try ModelContainer(for: schema, configurations: [configuration])
            let sampleData: [any PersistentModel] = [
                Campaign.exampleCampaign(), Player.examplePlayer()
            ]
            sampleData.forEach {
                container.mainContext.insert($0)
            }
            return container
        } catch {
            fatalError("Failed to create container: \(error.localizedDescription)")
        }
    }()
}

let previewContainer: ModelContainer = {
    do {
        let container = try ModelContainer(for: Player.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        Task { @MainActor in
            let context = container.mainContext
            
            let player = Player.examplePlayer()
            context.insert(player)
            
            let npc = NPC.exampleNPC()
            context.insert(npc)
            
            let campaign = Campaign.exampleCampaignWithPlayers()
            context.insert(campaign)
        }
        return container
    } catch {
        fatalError("Failed to create container: \(error.localizedDescription)")
    }
}()
