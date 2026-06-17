//
//  FavoritesView.swift
//  Master Hand
//
//  Created by Found on 17/06/26.
//
import SwiftUI
import SwiftData
import SwiftDataSQLite

struct FavoritesView: View {
    // Busca os sistemas favoritados e ordena pelo campo 'name' de forma ascendente (A-Z)
    @Query(
        filter: #Predicate<System> { $0.isFavorite == true },
        sort: \System.name,
        order: .forward
    )
    private var favoriteSystems: [System]
    
    // Estado que guarda o sistema que foi clicado para abrir a sheet
    @State private var selectedSystem: System?
    
    // Define duas colunas flexíveis com espaçamento horizontal de 16pt
    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading){
                Text("Favoritos")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal,20)
                
                Group {
                    if favoriteSystems.isEmpty {
                        ContentUnavailableView(
                            "Sem Favoritos",
                            systemImage: "heart.slash",
                            description: Text("Os sistemas que você favoritar aparecerão aqui.")
                        )
                    } else {
                        ScrollView {
                            // O LazyVGrid distribui os cards perfeitamente em 2 colunas
                            LazyVGrid(columns: columns, spacing: 24) {
                                ForEach(favoriteSystems) { system in
                                    // Mudamos para Button para gerenciar o clique manualmente
                                    Button(action: {
                                        selectedSystem = system
                                    }) {
                                        SystemDefaultCard(system: system)
                                    }
                                    .buttonStyle(.plain)
                                }
                            }
                            .padding(.horizontal, 16)
                            .padding(.top, 8)
                        }
                    }
                }
            }
            // Modificador que escuta o 'selectedSystem' e abre a sheet automaticamente
            .sheet(item: $selectedSystem) { system in
                SystemDetails(system: system)
            }
        }
    }
}
    
#Preview {
    FavoritesView()
        .modelContainer(
            for: [System.self],
            inMemory: true,
            sqliteDatabasePath: Bundle.main.path(forResource: "db", ofType: "sqlite")!
        )
}
