//
//  SystemDetailsView.swift
//  FinalProjectFoundation
//
//  Created by Found on 09/06/26.
//

import SwiftUI

struct SystemDetails: View {
    @Environment(\.dismiss) var dismiss
    let system: System
    @State private var isFavorite: Bool = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    SystemCover(cover: system.cover)
                        .frame(width: 200)
                        .padding(.top)

                    Text(system.name)
                        .font(.title2).bold()

                    Text(system.getGenreList().joined(separator: " | "))
                        .font(.subheadline)

                    Text(system.desc)
                        .padding()

                    if let url = URL(string: system.storeLink) {
                        Link(destination: url) {
                            Text("Disponível em: \(system.store_name)")
                                .font(.footnote)
                                .padding()
                                .background(Color.blue.opacity(0.1))
                                .cornerRadius(10)
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark.circle.fill").foregroundStyle(.gray)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: { isFavorite.toggle() }) {
                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                            .foregroundStyle(isFavorite ? .red : .gray)
                    }
                }
            }
        }
    }
}

#Preview {
    let sample = System(
        id: 1,
        name: "Ordem Paranormal",
        cover: nil,
        genre1: "Terror",
        genre2: "Mistério",
        storeLink: "https://www.apple.com",
        store_name: "Loja Oficial",
        desc: "Este é um exemplo de descrição para testar como o conteúdo aparece dentro da sheet. O layout deve ser scrollável caso o texto seja muito longo. AAAAAAAAAAAAAAAAAAA",
        price: 99.90
    )
    
    SystemDetails(system: sample)
}
