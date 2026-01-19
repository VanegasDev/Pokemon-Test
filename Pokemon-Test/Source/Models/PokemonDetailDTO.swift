//
//  PokemonDetailDTO.swift
//  Pokemon-Test
//
//  Created by Mario Vanegas on 19/1/26.
//

import Foundation

struct PokemonDetailDTO: Decodable {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let types: [PokemonTypeSlotDTO]
    let stats: [PokemonStatDTO]
    let sprites: PokemonSpritesDTO
}

// MARK: - types

struct PokemonTypeSlotDTO: Decodable {
    let slot: Int
    let type: NamedAPIResourceDTO
}

// MARK: - stats

struct PokemonStatDTO: Decodable {
    let baseStat: Int
    let stat: NamedAPIResourceDTO

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case stat
    }
}

// MARK: - sprites
struct PokemonSpritesDTO: Decodable {
    let other: PokemonOtherSpritesDTO?
}

struct PokemonOtherSpritesDTO: Decodable {
    let home: PokemonHomeSpritesDTO?
    let officialArtwork: PokemonOfficialArtworkDTO?

    enum CodingKeys: String, CodingKey {
        case home
        case officialArtwork = "official-artwork"
    }
}

struct PokemonHomeSpritesDTO: Decodable {
    let frontDefault: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

struct PokemonOfficialArtworkDTO: Decodable {
    let frontDefault: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

struct NamedAPIResourceDTO: Decodable {
    let name: String
    let url: String
}
