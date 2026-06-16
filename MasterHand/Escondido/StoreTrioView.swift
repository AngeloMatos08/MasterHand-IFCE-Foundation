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
    
    @State private var selectedSystem: System?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(category)
                .font(.title)
                .fontWeight(.semibold)
            
            HStack(alignment: .center, spacing: 8) {
                ForEach(systems.prefix(3)) { system in
                    // O card agora é um botão que define o sistema selecionado
                    Button(action: {
                        selectedSystem = system
                    }) {
                        SystemStoreCard(system: system)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        // Sempre que selectedSystem ganhar um valor, a sheet sobe automaticamente!
        .sheet(item: $selectedSystem) { system in
            SystemDetails(system: system)
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
    
    let sample2 = System(
        id: 1,
        name: "flavio oblsonaro",
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
        systems: [sample, sample, sample2]
    )
}
