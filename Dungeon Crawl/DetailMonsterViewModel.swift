//
//  DetailMonsterViewModel.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 21/2/24.
//

import SwiftUI

@Observable
final class DetailMonsterViewModel {
    let persistence: PersistenceProtocol
    var selectedMonster: String?
    
    var errorMessage = ""
    var showAlert = false
    var monster: NewMonster?
    
    init(persistence: PersistenceProtocol = Persistence.shared, selectedMonster: String = "") {
        self.persistence = persistence
        self.selectedMonster = selectedMonster
        Task {
            await getSelectedMonster()
        }
    }
    
    @MainActor func getSelectedMonster() async {
        do {
            monster = try await persistence.getMonsterDetail(index: selectedMonster ?? "")
        } catch let error as NetworkErrors {
            print(error)
            errorMessage = error.description
            showAlert.toggle()
        } catch {
            errorMessage = error.localizedDescription
            showAlert.toggle()
        }
    }
}
