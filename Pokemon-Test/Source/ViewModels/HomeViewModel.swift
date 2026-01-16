//
//  HomeViewModel.swift
//  Pokemon-Test
//
//  Created by Mario Vanegas on 14/1/26.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var pokemon: [PokemonItem] = []
}
