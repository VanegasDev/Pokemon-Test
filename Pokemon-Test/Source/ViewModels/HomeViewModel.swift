//
//  HomeViewModel.swift
//  Pokemon-Test
//
//  Created by Mario Vanegas on 14/1/26.
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    @Published var pokemon: [Pokemon] = []
    @Published var isShowingAlert = false
    @Published var localizedError: Error?
    @Published var filterQuery: String = ""
    
    // MARK: - Properties
    
    private let pokemonService: PokemonListServiceType
    private var cancellables: Set<AnyCancellable> = []
    
    var filteredPokemon: [Pokemon] {
        guard !filterQuery.isEmpty else {
            return pokemon
        }
        
        return pokemon.filter { $0.name.lowercased().contains(filterQuery.lowercased()) }
    }
    
    // MARK: - Initializers
    
    init(pokemonService: PokemonListServiceType = PokemonListService()) {
        self.pokemonService = pokemonService
    }
    
    // MARK: - Methods
    
    func fetchPokemons() {
        pokemonService
            .fetchPokemonList()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                if case let .failure(error) = completion {
                    self?.localizedError = error
                    self?.isShowingAlert = true
                }
            } receiveValue: { [weak self] resultList in
                self?.pokemon = resultList.results
                    .map {
                        Pokemon(
                            id: $0.imageURL?.pokemonId ?? 0,
                            name: $0.name,
                            imageURL: Constants.imageURL(id: $0.imageURL?.pokemonId ?? 0)
                        )
                    }
            }
            .store(in: &cancellables)
    }
}
