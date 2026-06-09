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
    let title: Title
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            SystemCover(cover: title.cover)
                .frame(width: 165)
            
            VStack(alignment: .center, spacing: 4) {
                Text(title.name)
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
    let sample = Title(
        id: 1,
        name: "Ordem Paranormal",
        cover: nil,
        genre1: "Fantasia",
        genre2: "Medieval",
        price: 99.90
    )
    SystemDefaultCard(title: sample)
        .padding()
}
