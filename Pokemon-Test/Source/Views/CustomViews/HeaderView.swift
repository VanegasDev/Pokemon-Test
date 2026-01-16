//
//  HeaderView.swift
//  Pokemon-Test
//
//  Created by Mario Vanegas on 14/1/26.
//

import SwiftUI

struct HeaderView: View {
    let name: String
    let id: Int
    var onBack: (() -> Void)? = nil

    var body: some View {
        HStack(spacing: 12) {
            Button {
                onBack?()
            } label: {
                Image(systemName: "chevron.left")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(Color(red: 0.10, green: 0.23, blue: 0.35))
                    .frame(width: 40, height: 40)
            }
            .buttonStyle(.plain)

            Text(name)
                .font(.system(size: 24, weight: .black))
                .foregroundStyle(Color(red: 0.10, green: 0.23, blue: 0.35))

            Spacer()

            Text("#\(String(format: "%03d", id))")
                .font(.system(size: 18, weight: .heavy))
                .foregroundStyle(.secondary)
        }
        .padding(.horizontal, 14)
        .frame(height: 56)
        .background(Color.white)
        .overlay(
            VStack(spacing: 0) {
                Divider()
                Spacer()
                Rectangle()
                    .fill(Color.blue.opacity(0.75))
                    .frame(height: 2)
            }
        )
    }
}

#Preview {
    ZStack {
        Color.black.opacity(0.9).ignoresSafeArea()
        VStack(spacing: 0) {
            HeaderView(name: "Charizard", id: 6)
            Spacer()
        }
        .padding(.top, 40)
    }
}
