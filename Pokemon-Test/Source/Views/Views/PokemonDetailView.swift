//
//  PokemonDetailView.swift
//  Pokemon-Test
//
//  Created by Mario Vanegas on 19/1/26.
//

import SwiftUI

struct PokemonDetailScreen: View {
    
    @StateObject var viewModel: PokemonDetailViewModel
    @Environment(\.dismiss) private var dismiss

    init(viewModel: PokemonDetailViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                TopBar(
                    title: viewModel.name,
                    numberText: "#\(String(format: "%03d", viewModel.id))",
                    onBack: { dismiss() }
                )
                .padding(.top, 6)

                HeroCard(
                    imageURL: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/6.png"),
                    typeText: "Fire"
                )
                    .padding(.top, 14)

                WeightHeightCard(
                    weightKg: Double(viewModel.pokemonDetail?.weight ?? 0),
                    heightM: Double(viewModel.pokemonDetail?.height ?? 0)
                )
                    .padding(.top, 16)

                Divider()
                    .opacity(0) // solo para dar aire como en el mock
                    .frame(height: 18)

                Text(clean("description"))
                    .font(.system(size: 16))
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 30)
            }
            .background(Color.white)
        }
        .background(Color(.systemGroupedBackground))
        .navigationBarHidden(true)
        .onAppear(perform: viewModel.fetchPokemonDetail)
    }

    private func clean(_ text: String) -> String {
        text.replacingOccurrences(of: "\n", with: " ")
            .replacingOccurrences(of: "\u{000C}", with: " ")
    }
}

// MARK: - TopBar

struct TopBar: View {
    let title: String
    let numberText: String
    let onBack: () -> Void

    var body: some View {
        HStack(spacing: 12) {
            Button(action: onBack) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(Color(red: 0.10, green: 0.23, blue: 0.35))
                    .frame(width: 44, height: 44)
            }
            .buttonStyle(.plain)

            Text(title)
                .font(.system(size: 24, weight: .black))
                .foregroundStyle(Color(red: 0.10, green: 0.23, blue: 0.35))

            Spacer()

            Text(numberText)
                .font(.system(size: 20, weight: .heavy))
                .foregroundStyle(.secondary)
        }
        .padding(.horizontal, 16)
        .frame(height: 56)
        .background(Color.white)
    }
}

// MARK: - Hero Card (imagen + fondo oscuro + pill)

struct HeroCard: View {
    let imageURL: URL?
    let typeText: String

    var body: some View {
        ZStack(alignment: .bottom) {
            RoundedRectangle(cornerRadius: 26, style: .continuous)
                .fill(Color.black.opacity(0.92))
                .frame(height: 240)
                .overlay(
                    RoundedRectangle(cornerRadius: 26, style: .continuous)
                        .fill(
                            LinearGradient(
                                colors: [.black.opacity(0.92), .black.opacity(0.75)],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                )

            VStack(spacing: 12) {
                AsyncImage(url: imageURL) { phase in
                    switch phase {
                    case .success(let image):
                        image.resizable().scaledToFit()
                    case .failure:
                        Image(systemName: "photo")
                            .font(.system(size: 28))
                            .foregroundStyle(.white.opacity(0.75))
                    default:
                        ProgressView().tint(.white)
                    }
                }
                .frame(height: 290)
                .offset(y: -45)

                TypePill(text: typeText)
                    .padding(.bottom, 16)
            }
        }
        .padding(.horizontal, 16)
    }
}

struct TypePill: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.system(size: 14, weight: .bold))
            .foregroundStyle(Color.red)
            .padding(.horizontal, 18)
            .padding(.vertical, 9)
            .background(Color.white)
            .clipShape(Capsule())
            .overlay(
                Capsule().stroke(Color.red.opacity(0.5), lineWidth: 1)
            )
    }
}

// MARK: - Weight / Height Card

struct WeightHeightCard: View {
    let weightKg: Double
    let heightM: Double

    var body: some View {
        HStack(spacing: 0) {
            MetricItem(
                icon: "scalemass",
                value: "\(weightKg)",
                label: "Peso"
            )

            Divider()
                .frame(height: 36)
                .padding(.horizontal, 12)

            MetricItem(
                icon: "ruler",
                value: "\(heightM)",
                label: "Altura"
            )
        }
        .padding(.vertical, 14)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .shadow(color: .black.opacity(0.06), radius: 10, x: 0, y: 6)
        .padding(.horizontal, 16)
    }
}

struct MetricItem: View {
    let icon: String
    let value: String
    let label: String

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 22, weight: .bold))
                .foregroundStyle(Color.blue)
                .frame(width: 34)

            VStack(alignment: .leading, spacing: 2) {
                Text(value)
                    .font(.system(size: 22, weight: .black))
                    .foregroundStyle(Color(red: 0.10, green: 0.23, blue: 0.35))
                Text(label)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(Color.blue.opacity(0.9))
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(.horizontal, 6)
    }
}
