//
//  PokemonTarget.swift
//  Pokemon-Test
//
//  Created by Mario Vanegas on 15/1/26.
//

import Moya

enum PokemonTarget {
    case pokemonList
}

extension PokemonTarget: PokeTargetType {
    var requestEndpoint: String {
        switch self {
        case .pokemonList:
            return "pokemon"
        }
    }
    
    var requestMethod: PokeNetworkMethod {
        switch self {
        case .pokemonList:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .pokemonList:
            return .requestPlain
        }
    }
}
