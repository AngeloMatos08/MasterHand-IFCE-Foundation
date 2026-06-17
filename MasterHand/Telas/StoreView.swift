import SwiftUI
import SwiftData
import SwiftDataSQLite

struct StoreView: View {
    
    // Busca todos os sistemas do banco
    @Query var systems: [System]
    
    // Propriedade computada para ordenar e separar o catálogo completo em blocos de 3
    private var chunkedCatalog: [[System]] {
        // 1. Ordena o catálogo inteiro por ID de forma crescente
        let sortedSystems = systems.sorted { $0.id < $1.id }
        
        // 2. Agrupa os sistemas de 3 em 3
        return stride(from: 0, to: sortedSystems.count, by: 3).map { index in
            Array(sortedSystems[index..<min(index + 3, sortedSystems.count)])
        }
    }
    
    var body: some View {
        List {
            Text("Sistemas")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            // 1. Sugeridos
            StoreTrioView(
                category: "Sugeridos",
                systems: systems.filter { [3, 1, 17].contains($0.id) }
            )
            .listRowSeparator(.hidden)
            
            // 2. Fantasia
            StoreTrioView(
                category: "Fantasia",
                systems: systems.filter { [2, 16, 8].contains($0.id) }
            )
            .listRowSeparator(.hidden)
            
            // 3. Sobrevivência
            StoreTrioView(
                category: "Pós-Apocalípse",
                systems: systems.filter { [15, 10, 19].contains($0.id) }
            )
            .listRowSeparator(.hidden)
            
            // 4. Faroeste
            StoreTrioView(
                category: "Faroeste",
                systems: systems.filter { [9, 14, 5].contains($0.id) }
            )
            .listRowSeparator(.hidden)
            
// --- CATÁLOGO INTEIRO ---
            VStack(alignment: .leading, spacing: 16) {
                
            // Percorre as fatias de 3 itens geradas dinamicamente
                ForEach(Array(chunkedCatalog.enumerated()), id: \.offset) { index, chunk in
                    StoreTrioView(
                        // Mostra o título "Todos os Sistemas" apenas no primeiro bloco
                        category: index == 0 ? "Todos os Sistemas" : "",
                        systems: chunk
                    )
                    .listRowSeparator(.hidden)
                }
                .listRowSeparator(.hidden)
            }
            
        }
        .listStyle(.plain)
    }
}

#Preview {
    StoreView()
        .modelContainer(
            for: [System.self],
            inMemory: true,
            sqliteDatabasePath: Bundle.main.path(forResource: "db", ofType: "sqlite")!
        )
}
