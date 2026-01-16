//
//  SearchView.swift
//  Pokemon-Test
//
//  Created by Mario Vanegas on 14/1/26.
//

import SwiftUI

struct SearchView: View {
    @State private var query: String = ""

    var onSearch: ((String) -> Void)? = nil

    var body: some View {
        HStack(spacing: 12) {
            TextField("Buscar", text: $query)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .padding(.leading, 18)
                .frame(height: 52)

            Button {
                onSearch?(query)
            } label: {
                Image(Constants.Icons.search)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(Color.blue)
                    .frame(width: 52, height: 52)
                    .background(Color(red: 0.96, green: 0.78, blue: 0.19))
                    .clipShape(Circle())
            }
            .buttonStyle(.plain)
        }
        .background(
            RoundedRectangle(cornerRadius: 26, style: .continuous)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
        )
        .frame(height: 52)
        .padding(22)
        .background(Color.white)
    }
}

#Preview {
    ZStack {
        Color.black.opacity(0.9).ignoresSafeArea()
        VStack {
            Spacer()
            SearchView()
            Spacer()
        }
    }
}
