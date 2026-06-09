//
//  FavoritesCard.swift
//  FinalProjectFoundation
//
//  Created by Found on 02/06/26.
//
import SwiftUI
import SwiftData
import SwiftDataSQLite

// Este é o Card de Favorito puro e altamente reutilizável.
struct SystemDefaultCard: View {
    let system: System
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            SystemCover(cover: system.cover)
                .frame(width: 165)
            
            VStack(alignment: .center, spacing: 4) {
                Text(system.name)
                    .font(.headline)
                    .frame(width: 165, alignment: .center)
                    .lineLimit(1)
                
                HStack(spacing: 6) {
//                    ForEach(title.getGenreList(), id: \.self) { genre in
//                        Text(genre)
//                            .font(.subheadline)
//                            .padding(.horizontal, 8)
//                            .padding(.vertical, 4)
//                    }
                    Text("Sobrevivência | Aventura")
                        .multilineTextAlignment(.center)
                        
                }
                .font(.subheadline)
            }
        }
        .frame(width: 180)
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
    SystemDefaultCard(system: sample)
        .padding()
}
