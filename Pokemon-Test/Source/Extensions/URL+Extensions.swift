//
//  URL+Extensions.swift
//  Pokemon-Test
//
//  Created by Mario Vanegas on 15/1/26.
//

import Foundation

extension URL {
    var pokemonId: Int? {
        self.pathComponents.compactMap(Int.init).last
    }
}
