//
//  CapaSistemaView.swift
//  FinalProjectFoundation
//
//  Created by Found on 02/06/26.
//

import SwiftUI

struct SystemCover: View {
    let cover: Data?
    
    // Tornamos a proporção parametrizável com um valor padrão (16/26), 
    // permitindo que este mesmo componente seja usado em cards de tamanhos diferentes!
    var aspectRatio: CGFloat = 16/26
    
    var body: some View {
        ZStack {
            // Placeholder estilizado para RPG
            Color.gray.opacity(0.3)
            
            Image(systemName: "hexagon.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(.gray.opacity(0.5))
                .padding(30) // Reduzido o padding para o ícone não sumir em frames menores
        
            if let cover = cover,
               let uiImage = UIImage(data: cover) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
            }
        }
        .aspectRatio(aspectRatio, contentMode: .fit)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    SystemCover(cover: nil)
        .frame(width: 120)
        .padding()
}
