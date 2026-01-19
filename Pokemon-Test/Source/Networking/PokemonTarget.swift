//
//  PokemonTarget.swift
//  Pokemon-Test
//
//  Created by Mario Vanegas on 15/1/26.
//

import Moya

enum PokemonTarget {
    case pokemonList
    case pokemonDetail(id: Int)
}

extension PokemonTarget: PokeTargetType {
    var requestEndpoint: String {
        switch self {
        case .pokemonList:
            return "pokemon"
        case let .pokemonDetail(id):
            return "/pokemon/\(id)"
        }
    }
    
    var requestMethod: PokeNetworkMethod {
        switch self {
        case .pokemonList, .pokemonDetail:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .pokemonList, .pokemonDetail:
            return .requestPlain
        }
    }
}
