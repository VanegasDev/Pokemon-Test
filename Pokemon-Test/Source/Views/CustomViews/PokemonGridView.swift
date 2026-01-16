//
//  PokemonGridView.swift
//  Pokemon-Test
//
//  Created by Mario Vanegas on 14/1/26.
//

import SwiftUI

struct PokemonGridView: View {
    let pokemons: [PokemonItem]

    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(pokemons) { pokemon in
                    PokemonCardView(
                        name: pokemon.name,
                        imageURL: pokemon.imageURL
                    )
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 12)
            .padding(.bottom, 24)
        }
    }
}

struct PokemonGridPreview: View {
    let samplePokemons: [PokemonItem] = [
        PokemonItem(name: "Charizard",
                imageURL: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/6.png")),
        PokemonItem(name: "Bulbasaur",
                imageURL: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png")),
        PokemonItem(name: "Charmander",
                imageURL: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png")),
        PokemonItem(name: "Pikachu",
                imageURL: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png")),
        PokemonItem(name: "Ditto",
                imageURL: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/132.png")),
        PokemonItem(name: "Squirtle",
                imageURL: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/7.png"))
    ]

    var body: some View {
        PokemonGridView(pokemons: samplePokemons)
    }
}

#Preview {
    PokemonGridPreview()
}
