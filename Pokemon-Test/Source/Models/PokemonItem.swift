//
//  PokemonItem.swift
//  Pokemon-Test
//
//  Created by Mario Vanegas on 14/1/26.
//

import Foundation

// MARK: - API Model

struct PokemonItem: Codable {
    let name: String
    let imageURL: URL?
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageURL = "url"
    }
}

// MARK: - APP Model

struct Pokemon: Identifiable {
    let id: Int
    let name: String
    let imageURL: URL?
}
