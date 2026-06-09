//
//  SystemStoreCard.swift
//  FinalProjectFoundation
//
//  Created by Found on 02/06/26.
//
import SwiftUI
import SwiftData

struct SystemStoreCard: View {
    let system: System

    var body: some View {
        // Frame com a capa e o frame dos textos
        VStack(alignment: .leading, spacing: 8) {
            SystemCover(cover: system.cover)
                .frame(width: 120)
            
            // frame dos textos
            VStack(alignment: .leading, spacing: 4) {
                
                // Título do sistema
                Text(system.name)
                    .font(.headline)
                    .lineLimit(2) // Limita a 2 linhas para não quebrar o layout se o nome for gigante
                    .frame(width: 120, height: 44, alignment: .topLeading)

                Group {
                    if let price = system.price {
                        if price == 0 {
                            Text("Gratuito")
                        } else {
                            Text(price.formatted(.currency(code: "BRL")))
                        }
                    } else {
                        Text("Preço indisponível")
                    }
                }
                .font(.footnote)
            }
        }
        .frame(width: 120)
    }
}

#Preview {
    let sample = System(
        id: 1,
        name: "Ordem Paranormal",
        cover: nil,
        genre1: "",
        genre2: "",
        price: 99.99
    )
    
    SystemStoreCard(system: sample)
        .padding()
}
