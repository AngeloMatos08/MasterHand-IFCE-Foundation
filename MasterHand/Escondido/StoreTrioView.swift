//
//  CategoryView.swift
//  FinalProjectFoundation
//
//  Created by Found on 09/06/26.
//

import SwiftUI

struct StoreTrioView: View {

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
    
    StoreTrioView(
        category: "Sistemas em Destaque",
        systems: [sample, sample, sample]
    )
}
