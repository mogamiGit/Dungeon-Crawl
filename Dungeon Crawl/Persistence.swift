//
//  Persistence.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 28/1/24.
//

import Foundation
import SwiftUI

protocol PersistenceProtocol {
    func getMonsters() async throws -> [MonsterList]
}

@Observable
final class Persistence: PersistenceProtocol {
    static let shared = Persistence()
    
    func getMonsters() async throws -> [MonsterList] {
        do {
            let (data, response) = try await URLSession.shared.data(for: .get(url: .getMonsters))
            guard let response = response as? HTTPURLResponse else { throw NetworkErrors.noConnection }
            
            if response.statusCode == 200 {
                do {
                    return try JSONDecoder().decode(MonsterListDTO.self, from: data).results.map(\.toNewResults)
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
}




