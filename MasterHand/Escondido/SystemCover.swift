//
//  CapaSistemaView.swift
//  FinalProjectFoundation
//
//  Created by Found on 02/06/26.
//

import SwiftUI

struct SystemCover: View {
    let cover: Data?
    
    var aspectRatio: CGFloat = 16/26
    
    var body: some View {
        ZStack {
            // Placeholder estilizado para RPG
            Color.gray.opacity(0.3)
            
            Image(systemName: "hexagon.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(.gray.opacity(0.5))
                .padding(30)
        
            if let cover = cover,
               let uiImage = UIImage(data: cover) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(aspectRatio, contentMode: .fit)
            }
        }
        .aspectRatio(aspectRatio, contentMode: .fit)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        // Adiciona a sombra colorida (brilho) ao redor da capa do card
        .shadow(color: Color.mhbig.opacity(0.20), radius: 4, x: 0, y: 4)
    }
}

#Preview {
    let sampleCover = UIImage(named: "Ordem")?.pngData()
    SystemCover(cover: sampleCover)
        .frame(width: 120)
        .padding()
}
