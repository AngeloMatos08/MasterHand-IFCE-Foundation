//
//  CategoryView.swift
//  FinalProjectFoundation
//
//  Created by Found on 09/06/26.
//

import SwiftUI

struct CategoryView: View {

    let category: String
    let systems: [System]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // nome da categoria
            Text(category)
                .font(.title)
                .fontWeight(.semibold)
                .padding(.horizontal, 20)
            
            // trio de sistemas
            HStack(alignment: .center, spacing: 8) {
                
                // Exibimos no máximo 3 cards usando o prefix(3)
                ForEach(systems.prefix(3)) { system in
                    SystemStoreCard(system: system)
                }
            }.padding(.horizontal)
        }
    }
}


#Preview {
    let sampleSystems = [
        System(id: 1, name: "Ordem Paranormal", cover: nil, genre1: "Terror", genre2: "Investigação", price: 99.90),
        System(id: 2, name: "Tormenta20", cover: nil, genre1: "Fantasia", genre2: "Medieval", price: 67.42),
        System(id: 3, name: "Oblívio", cover: nil, genre1: "Anime", genre2: "Multiverso", price: 00.00)
    ]
    
    CategoryView(
        category: "Sistemas em Destaque",
        systems: sampleSystems
    )
}
