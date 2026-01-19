//
//  PokemonDetailViewModel.swift
//  Pokemon-Test
//
//  Created by Mario Vanegas on 19/1/26.
//

import Foundation
import Combine

class PokemonDetailViewModel: ObservableObject {
    @Published var pokemonDetail: PokemonDetailDTO?
    
    private let service: PokemonListServiceType = PokemonListService()
    private var cancellables: Set<AnyCancellable> = []
    
    let name: String
    let id: Int
    
    init(name: String, id: Int) {
        self.name = name
        self.id = id
    }
    
    func fetchPokemonDetail() {
        service
            .fetchPokemonDetail(id: id)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                // Handle errors if needed
            } receiveValue: { [weak self] detail in
                self?.pokemonDetail = detail
            }
            .store(in: &cancellables)
    }
}
