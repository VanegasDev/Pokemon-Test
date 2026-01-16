//
//  PokemonItem.swift
//  Pokemon-Test
//
//  Created by Mario Vanegas on 14/1/26.
//

import Foundation

struct PokemonItem: Codable, Identifiable {
    let id = UUID()
    let name: String
    let imageURL: URL?
    
    init(name: String, imageURL: URL?) {
        self.name = name
        self.imageURL = imageURL
    }
}

