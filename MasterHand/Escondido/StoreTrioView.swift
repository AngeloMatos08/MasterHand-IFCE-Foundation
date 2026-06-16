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
    
    @Query var systems: [System]
    
    let category: String
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // nome da categoria
            Text(category)
                .font(.title)
                .fontWeight(.semibold)
            
            // trio de sistemas
            HStack(alignment: .center, spacing: 8) {
                
                // Exibimos no máximo 3 cards usando o prefix(3)
                ForEach(systems.prefix(3)) {system in SystemStoreCard(system: system)
                }
            }.padding(.horizontal)
        }
    }
}


#Preview {
    
    StoreTrioView(
        category: "Sistemas em Destaque",
    )
    
    .modelContainer( // ✅
        for: [System.self],
        inMemory: true,
        sqliteDatabasePath: Bundle.main.path(forResource: "db", ofType: "sqlite")!
    )
}
