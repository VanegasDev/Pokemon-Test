//
//  PokemonListService.swift
//  Pokemon-Test
//
//  Created by Mario Vanegas on 15/1/26.
//

import Foundation
import Combine

protocol PokemonListServiceType {
    func fetchPokemonList() -> AnyPublisher<ResultList, Error>
}

struct PokemonListService: PokemonListServiceType {
    private let networkManager: NetworkManagerType
    
    init(with networkManager: NetworkManagerType = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func fetchPokemonList() -> AnyPublisher<ResultList, Error> {
        networkManager.request(PokemonTarget.pokemonList)
    }
}
