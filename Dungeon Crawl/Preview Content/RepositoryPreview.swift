//
//  RepositoryPreview.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 24/9/23.
//

import Foundation
import SwiftData

extension Campaign {
    static let previewContainer: ModelContainer = {
        do {
            let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
            let container = try ModelContainer(for: Campaign.self, configurations: configuration)
            let test = Campaign.test
            let context = ModelContext(container)
            context.insert(test)
            return container
        } catch {
            fatalError()
        }
    }()
    
    static let test = Campaign(name: "Magic DnD Trip",
                             location: "Castle Darkhold",
                             level: 4,
                             players: [
                                Player(name: "Sefard The Scapist",
                                            level: 5,
                                            raceType: "Human",
                                            classType: "Wizard",
                                            age: 25,
                                            alignment: "Lawful Good",
                                            ideals: "Justice and Freedom",
                                            defects: "Impatient",
                                            inspiration: true,
                                            notes: "Has a pet owl named Hoot"),
                                Player(name: "Jimmy HugBear",
                                            level: 3,
                                            raceType: "Elf",
                                            classType: "Druid",
                                            age: 80,
                                            alignment: "Chaotic Good",
                                            ideals: "Justice and Freedom",
                                            defects: "Impatient",
                                            inspiration: false,
                                            notes: "He transforms in Owlbear")])
}

extension Player {
    static let test = Player(name: "Sefard The Scapist", level: 5, raceType: "Human", classType: ClassType.wizard.rawValue, age: 25, alignment: "Lawful Good", ideals: "Justice and Freedom", defects: "Impatient", inspiration: true, notes: "Has a pet owl named Hoot")
}
