//
//  SearchView.swift
//  Pokemon-Test
//
//  Created by Mario Vanegas on 14/1/26.
//

import SwiftUI

struct SearchView: View {
    @State var query: String = ""

    var onSearch: ((String) -> Void)? = nil

    var body: some View {
        HStack(spacing: 12) {
            TextField("Buscar", text: $query)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .frame(height: 36)

            Button {
                onSearch?(query)
            } label: {
                Image(Constants.Icons.search)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(Color.blue)
                    .frame(width: 27, height: 27)
                    .background(Color(Constants.Colors.lightYellow))
                    .clipShape(Circle())
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal, 8)
        .background(
            RoundedRectangle(cornerRadius: 26, style: .continuous)
                .stroke(Color(Constants.Colors.lightGray))
        )
        .frame(height: 36)
        .padding(22)
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
