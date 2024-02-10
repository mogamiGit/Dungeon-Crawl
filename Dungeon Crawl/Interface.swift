//
//  Interface.swift
//  Dungeon Crawl
//
//  Created by Monica Galan de la Llana on 28/1/24.
//

import Foundation

let prod = URL(string: "https://www.dnd5eapi.co/api/")!
let api = prod

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

enum NetworkErrors: Error {
    case badURLResponse(statusCode: Int)
    case badParse
    case generalError(Error)
    case noConnection
    
    var description: String {
        switch self {
        case .badURLResponse(let statusCode):
            return "Bad URL Response: \(statusCode) "
        case .badParse:
            return "Fail to parse the data"
        case .generalError(let generalError):
            return "Error General \(generalError))"
        case .noConnection:
            return "No HTTP connection"
        }
    }
}

extension URL {
    static let getMonsters = api.appending(path: "monsters/")
}

extension URLRequest {
    static func get(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        
        request.httpMethod = HTTPMethods.get.rawValue
        request.timeoutInterval = 30
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
}
