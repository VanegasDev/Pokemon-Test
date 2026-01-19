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
        .fullScreenCover(isPresented: $viewModel.isShowingDetailView) {
            if let selectedPokemon = viewModel.selectedPokemon {
                PokemonDetailScreen(
                    viewModel: PokemonDetailViewModel(
                        name: selectedPokemon.name,
                        id: selectedPokemon.id
                    )
                )
            }
        }
        .alert(
            "Error",
            isPresented: $viewModel.isShowingAlert
        ) {
            Button("Retry") {
                viewModel.fetchPokemons()
            }
            
            Button("Cancel", role: .cancel) {}
        } message: {
            Text(viewModel.localizedError?.localizedDescription ?? "An unexpected error occurred.")
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
        SearchView(query: viewModel.filterQuery) {
            viewModel.filterQuery = $0
        }
    }
    
    var gridView: some View {
        PokemonGridView(pokemons: viewModel.filteredPokemon) { pokemon in
            viewModel.showDetailView(for: pokemon)
        }
    }
}

#Preview {
    HomeView()
}
