//
//  HomeView.swift
//  Pokemon-Test
//
//  Created by Mario Vanegas on 14/1/26.
//

import SwiftUI

struct HomeView: View {
    let pokemon: [PokemonItem]
    
    var body: some View {
        ScrollView {
            TitleView()
            header
            searchBar
            gridView
        }
    }
    
    var header: some View {
        Group {
            HStack(spacing: 8) {
                Text("Hello, ")
                    .font(.title2) +
                Text("Welcome!")
                    .bold()
                    .font(.title2)
                Spacer()
            }
        }
        .padding(.horizontal, 26)
        .foregroundStyle(Color(Constants.Colors.gray))
    }
    
    var searchBar: some View {
        SearchView(query: "") { _ in
            
        }
    }
    
    var gridView: some View {
        PokemonGridView(pokemons: pokemon)
        
        
    }
}

#Preview {
    HomeView(
        pokemon: [
            PokemonItem(id: 6, name: "Charizard",
                        imageURL: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/6.png")),
            PokemonItem(id: 1, name: "Bulbasaur",
                        imageURL: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png")),
            PokemonItem(id: 4, name: "Charmander",
                        imageURL: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png")),
            PokemonItem(id: 25, name: "Pikachu",
                        imageURL: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png")),
            PokemonItem(id: 132, name: "Ditto",
                        imageURL: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/132.png")),
            PokemonItem(id: 7, name: "Squirtle",
                        imageURL: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/7.png"))
        ]
    )
}
