//
//  PokemonGridView.swift
//  Pokemon-Test
//
//  Created by Mario Vanegas on 14/1/26.
//

import SwiftUI

struct PokemonGridView: View {
    let pokemons: [Pokemon]
    let onTap: ((Pokemon) -> Void)?

    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(pokemons) { pokemon in
                    PokemonCardView(
                        id: pokemon.id,
                        name: pokemon.name,
                        imageURL: pokemon.imageURL
                    )
                    .onTapGesture {
                        onTap?(pokemon)
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 12)
            .padding(.bottom, 24)
        }
    }
}

struct PokemonGridPreview: View {
    let samplePokemons: [Pokemon] = [
        Pokemon(id: 1, name: "Bulbasaur", imageURL: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png")),
        Pokemon(id: 2, name: "Ivysaur", imageURL: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png")),
        Pokemon(id: 3, name: "Venusaur", imageURL: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png")),
        Pokemon(id: 4, name: "Charmander", imageURL: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png"))
    ]

    var body: some View {
        PokemonGridView(pokemons: samplePokemons) { _ in }
    }
}

#Preview {
    PokemonGridPreview()
}
