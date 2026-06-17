import SwiftUI
import SwiftData
import SwiftDataSQLite

struct StoreView: View {
    
    @Query var systems: [System]
    
    var body: some View {
        List {
            Text("Sistemas")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            // 1. Sugeridos - IDs dos sistemas que você quer exibir
            StoreTrioView(
                category: "Sugeridos",
                systems: systems.filter { system in
                    [3, 1, 17].contains(system.id) // Substitua pelos IDs reais dos seus 3 sistemas sugeridos
                }
            )
            .listRowSeparator(.hidden)
            
            // 2. Fantasia - Escolha manual por IDs
            StoreTrioView(
                category: "Fantasia",
                systems: systems.filter { system in
                    [2, 16, 8].contains(system.id) // Substitua pelos IDs reais que deseja nesta categoria
                }
            )
            .listRowSeparator(.hidden)
            
            // 3. Sobrevivência - Escolha manual por IDs
            StoreTrioView(
                category: "Pós-Apocalípse",
                systems: systems.filter { system in
                    [15, 10, 19].contains(system.id) // Substitua pelos IDs reais que deseja nesta categoria
                }
            )
            .listRowSeparator(.hidden)
            
            // 4. Faroeste - Escolha manual por IDs
            StoreTrioView(
                category: "Faroeste",
                systems: systems.filter { system in
                    [9, 14, 5].contains(system.id) // Substitua pelos IDs reais que deseja nesta categoria
                }
            )
            .listRowSeparator(.hidden)
            
        }
        .listStyle(.plain)
    }
}

#Preview {
    StoreView()
        .modelContainer( // ✅
            for: [System.self],
            inMemory: true,
            sqliteDatabasePath: Bundle.main.path(forResource: "db", ofType: "sqlite")!
            )
}
