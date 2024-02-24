//
//  MonstersViewModel.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 9/2/24.
//

import Foundation
import SwiftUI

@Observable
final class MonsterListViewModel {
    let persistence: PersistenceProtocol
    
    var monsters: [MonsterListItem] = []
    var errorMessage = ""
    var showAlert = false
    
    init(persistence: PersistenceProtocol = Persistence.shared) {
        self.persistence = persistence
        Task {
            await getInitialData()
        }
    }
    
    @MainActor func getInitialData() async {
        do {
            monsters = try await persistence.getMonsters()
        } catch let error as NetworkErrors {
            errorMessage = error.description
            showAlert.toggle()
        } catch {
            errorMessage = error.localizedDescription
            showAlert.toggle()
        }
    }
}
