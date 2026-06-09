//
//  SystemStoreCard.swift
//  FinalProjectFoundation
//
//  Created by Found on 02/06/26.
//
import SwiftUI
import SwiftData

struct SystemStoreCard: View {
    let title: Title

    var body: some View {
        // Frame com a capa e o frame dos textos
        VStack(alignment: .leading, spacing: 8) {
            SystemCover(cover: title.cover)
                .frame(width: 120)
            
            // frame dos textos
            VStack(alignment: .leading, spacing: 4) {
                
                // Título do sistema
                Text(title.name)
                    .font(.headline)
                    .lineLimit(2) // Limita a 2 linhas para não quebrar o layout se o nome for gigante
                    .frame(width: 120, height: 44, alignment: .topLeading)

                // Ao envelopar a condicional em um Group, todos os textos dentro dele
                // herdarão automaticamente os modificadores de fonte e cor aplicados abaixo!
                Group {
                    if let price = title.price {
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
    // Criamos um dado falso temporário apenas para o Xcode desenhar na tela de preview
    let sampleTitle = Title(
        id: 1,
        name: "Tormenta20",
        cover: nil,
        price: 99.99
    )
    
    SystemStoreCard(title: sampleTitle)
        .padding()
}
