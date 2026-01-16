//
//  TitleView.swift
//  Pokemon-Test
//
//  Created by Mario Vanegas on 14/1/26.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        HStack(spacing: 14) {
            ZStack {
                Image(Constants.Icons.pokemon)
                    .frame(width: 44, height: 44)
                Circle()
                    .fill(Color.blue.opacity(0.12))
                    .frame(width: 20, height: 20)
            }

            Text("Pokédex")
                .font(.system(size: 34, weight: .black))
                .foregroundStyle(Color.blue)

            Spacer()
        }
        .padding(.horizontal, 18)
        .frame(height: 84)
        .background(Color.white)
    }
}

#Preview {
    ZStack {
        Color.black.opacity(0.9).ignoresSafeArea()
        VStack(spacing: 0) {
            TitleView()
            Spacer()
        }
        .padding(.top, 40)
    }
}
