//
//  HomeView.swift
//  Pokemon-Test
//
//  Created by Mario Vanegas on 14/1/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        ScrollView {
            TitleView()
            header
            searchBar
            gridView
        }
        .onAppear(perform: viewModel.fetchPokemons)
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
        PokemonGridView(pokemons: viewModel.pokemon)
    }
}

#Preview {
    HomeView()
}
