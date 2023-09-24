//
//  Dungeon_CrawlApp.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 14/9/23.
//

import SwiftUI
import SwiftData

@main
struct Dungeon_CrawlApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            CampaignListView()
        }
        .modelContainer(sharedModelContainer)
    }
}
