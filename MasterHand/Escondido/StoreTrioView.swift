//
//  CategoryView.swift
//  FinalProjectFoundation
//
//  Created by Found on 09/06/26.
//

import SwiftUI
import SwiftData
import SwiftDataSQLite

struct StoreTrioView: View {
    
    let category: String
    let systems: [System] // 1. Agora a View apenas recebe os sistemas que deve exibir
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // nome da categoria
            Text(category)
                .font(.title)
                .fontWeight(.semibold)
                .padding(.horizontal,20)
                .foregroundColor(.mhbig)
            
            // trio de sistemas
            HStack(alignment: .center, spacing: 8) {
                
                // Exibimos no máximo 3 cards usando o prefix(3)
                ForEach(systems.prefix(3)) { system in
                    SystemStoreCard(system: system)
                }
            }.padding(.horizontal, 20)
        }
    }
}


#Preview {
    StoreTrioView(
        category: "Sistemas em Destaque",
        systems: [] // Passamos uma lista vazia ou mockada para o preview
    )
    .modelContainer( // ✅
        for: [System.self],
        inMemory: true,
        sqliteDatabasePath: Bundle.main.path(forResource: "db", ofType: "sqlite")!
    )
}
