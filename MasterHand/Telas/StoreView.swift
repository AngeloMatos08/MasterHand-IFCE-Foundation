import SwiftUI
import SwiftData
import SwiftDataSQLite

struct StoreView: View {
    
    @Query var systems: [System]
    
    var body: some View {
        NavigationStack(){
            List(){
                StoreTrioView(category: "Sugeridos")
                    .listRowSeparator(.hidden)
                StoreTrioView(category: "Fantasia")
                    .listRowSeparator(.hidden)
                StoreTrioView(category: "Sobrevivência")
                    .listRowSeparator(.hidden)
                StoreTrioView(category: "Faroeste")
                    .listRowSeparator(.hidden)
                
            }

            .listStyle(.plain)
            .navigationTitle("Sistemas")
            
            Text("Hello, World!")
        }
        
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
