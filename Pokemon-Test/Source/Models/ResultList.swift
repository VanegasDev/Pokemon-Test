//
//  ResultList.swift
//  Pokemon-Test
//
//  Created by Mario Vanegas on 14/1/26.
//

import Foundation

struct ResultList: Codable {
    let count: Int
    let next: String
    let previous: String?
    let results: [PokemonItem]
}
