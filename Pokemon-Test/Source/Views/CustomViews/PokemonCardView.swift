//
//  PokemonCardView.swift
//  Pokemon-Test
//
//  Created by Mario Vanegas on 14/1/26.
//

import SwiftUI

struct PokemonCardView: View {
    let name: String
    let imageURL: URL?

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Spacer()
                Text("#ID")
                    .font(.headline.weight(.bold))
                    .foregroundStyle(Color(Constants.Colors.lightGray))
            }

            AsyncImage(url: imageURL) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                case .failure(_):
                    Image(systemName: "photo")
                        .font(.system(size: 30))
                        .foregroundStyle(.secondary)
                default:
                    ProgressView()
                }
            }
            .frame(width: 70, height: 70)
            .frame(maxWidth: .infinity)

            Text(name)
                .font(.system(size: 28, weight: .heavy))
                .foregroundStyle(Color(Constants.Colors.indigo))
        }
        .padding(16)
        .frame(width: 180, height: 200)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .shadow(color: .black.opacity(0.18), radius: 18, x: 0, y: 10)
    }
}

#Preview {
    ZStack {
        Color.black.opacity(0.9).ignoresSafeArea()
        PokemonCardView(
            name: "Aron",
            imageURL: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/304.png")
        )
    }
}

