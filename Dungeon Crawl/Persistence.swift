//
//  Persistence.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 28/1/24.
//

import Foundation
import SwiftUI

protocol PersistenceProtocol {
    func getMonsters() async throws -> [MonsterListItem]
    func getMonsterDetail(index: String) async throws -> NewMonster
}

@Observable
final class Persistence: PersistenceProtocol {
    static let shared = Persistence()
    
    func getMonsters() async throws -> [MonsterListItem] {
        do {
            let (data, response) = try await URLSession.shared.data(for: .get(url: .getMonsters))
            guard let response = response as? HTTPURLResponse else { throw NetworkErrors.noConnection }
            
            if response.statusCode == 200 {
                do {
                    return try JSONDecoder().decode(MonsterListItemDTO.self, from: data).results.map(\.toNewResults)
                } catch {
                    throw NetworkErrors.badParse
                }
            } else {
                throw NetworkErrors.badURLResponse(statusCode: response.statusCode)
            }
        } catch let error as NetworkErrors {
            throw error
        } catch {
            throw NetworkErrors.generalError(error)
        }
    }
    
    func getMonsterDetail(index: String) async throws -> NewMonster {
        do {
            let (data, response) = try await URLSession.shared.data(for: .get(url: .getMonsters.appending(path: index)))
            guard let response = response as? HTTPURLResponse else { throw NetworkErrors.noConnection }
            
            if response.statusCode == 200 {
                do {
                    return try JSONDecoder().decode(MonsterDTO.self, from: data).toNewMosterModel()
                } catch {
                    print(error)
                    throw NetworkErrors.badParse
                }
            } else {
                throw NetworkErrors.badURLResponse(statusCode: response.statusCode)
            }
        } catch let error as NetworkErrors {
            throw error
        } catch {
            throw NetworkErrors.generalError(error)
        }
    }
}




