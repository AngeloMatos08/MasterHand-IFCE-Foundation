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
                    .foregroundStyle(.black)
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
                .foregroundStyle(.black)

            }
        }
        .frame(width: 120)
    }
}

#Preview {
    let cat1 = Category(
        id: "terror",
        name: "Terror"
    )
    let cat2 = Category(
        id: "investigacao",
        name: "Investigativo"
    )
    
    let sample = System(
        id: 1,
        name: "Ordem Paranormal",
        cover: nil,
        categories: [cat1, cat2],
        categoryShow1: cat1,
        categoryShow2: cat2,
        storeLink: "https://www.apple.com",
        store_name: "Loja Oficial",
        desc: "Este é um exemplo de descrição para testar como o conteúdo aparece dentro da sheet. O layout deve ser scrollável caso o texto seja muito longo. AAAAAAAAAAAAAAAAAAA",
        price: 99.90
    )
    
    SystemStoreCard(system: sample)
        .padding()
}
