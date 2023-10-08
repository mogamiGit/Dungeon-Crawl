//
//  RepositoryPreview.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 24/9/23.
//

import Foundation

extension CampaignModel {
    static let test = CampaignModel(name: "Magic DnD Trip", location: "Castle Darkhold", level: 4, players: [PlayerModel(name: "Sefard The Scapist", level: 5, raceType: "Human", classType: .wizard, age: 25, alignment: "Lawful Good", ideals: "Justice and Freedom", defects: "Impatient", inspiration: true, notes: "Has a pet owl named Hoot"), PlayerModel(name: "Jimmy HugBear", level: 5, raceType: "Human", classType: .warlock, age: 25, alignment: "Lawful Good", ideals: "Justice and Freedom", defects: "Impatient", inspiration: false, notes: "Has a pet owl named Hoot")])
}

extension PlayerModel {
    static let test = PlayerModel(name: "Sefard The Scapist", level: 5, raceType: "Human", classType: .wizard, age: 25, alignment: "Lawful Good", ideals: "Justice and Freedom", defects: "Impatient", inspiration: true, notes: "Has a pet owl named Hoot")
}
