import SwiftUI
import SwiftData
import SwiftDataSQLite

struct StoreView: View {
    
    // Busca todos os sistemas do banco
    @Query var systems: [System]
    
    // Método auxiliar para garantir que os elementos retornem exatamente na ordem dos IDs passados
    private func systemsForIDs(_ ids: [Int]) -> [System] {
        return ids.compactMap { id in
            systems.first { $0.id == id }
        }
    }
    
    // Propriedade computada para ordenar e separar o catálogo completo em blocos de 3
    private var chunkedCatalog: [[System]] {
        // 1. Ordena o catálogo inteiro por ID de forma crescente para manter o padrão
        let sortedSystems = systems.sorted { $0.id < $1.id }
        
        // 2. Agrupa os sistemas de 3 em 3
        return stride(from: 0, to: sortedSystems.count, by: 3).map { index in
            Array(sortedSystems[index..<min(index + 3, sortedSystems.count)])
        }
    }
    
    var body: some View {
        ZStack {
            // Imagem de fundo comum "Back"
            Image("Back")
                .resizable()
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    Text("Sistemas")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.mhbig)
                        .padding(.horizontal, 35)
                    
                    // 1. Sugeridos
                    StoreTrioView(
                        category: "Sugeridos",
                        systems: systemsForIDs([3, 1, 17])
                    )
                    .padding(.horizontal, 16)
                    
                    // 2. Fantasia
                    StoreTrioView(
                        category: "Fantasia",
                        systems: systemsForIDs([2, 16, 8])
                    )
                    .padding(.horizontal, 16)
                    
                    // 3. Sobrevivência
                    StoreTrioView(
                        category: "Pós-Apocalipse",
                        systems: systemsForIDs([15, 10, 19])
                    )
                    .padding(.horizontal, 16)
                    
                    // 4. Faroeste
                    StoreTrioView(
                        category: "Faroeste",
                        systems: systemsForIDs([9, 14, 5])
                    )
                    .padding(.horizontal, 16)
                    
                    // --- CATÁLOGO INTEIRO ---
                    // Percorre as fatias de 3 itens geradas dinamicamente
                    ForEach(Array(chunkedCatalog.enumerated()), id: \.offset) { index, chunk in
                        StoreTrioView(
                            // Mostra o título "Todos os Sistemas" apenas no primeiro bloco
                            category: index == 0 ? "Todos os Sistemas" : "",
                            systems: chunk
                        )
                        .padding(.horizontal, 16)
                    }
                }
                .padding(.vertical, 16)
            }
        }
    }
}

#Preview {
    StoreView()
        .modelContainer(
            for: [System.self, Category.self],
            inMemory: true,
            sqliteDatabasePath: Bundle.main.path(forResource: "db", ofType: "sqlite")!
        )
}
