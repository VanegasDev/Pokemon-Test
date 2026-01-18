//
//  Constants.swift
//  Pokemon-Test
//
//  Created by Mario Vanegas on 14/1/26.
//

import Foundation

enum Constants {
    static func imageURL(id: Int) -> URL? {
        URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/\(id).png")
    }
}
