import SwiftUI
import SwiftData
import SwiftDataSQLite

struct MainView: View {
    var body: some View {
        NavigationStack(){
            HStack{
                TabView {
                    Tab("Sistemas", systemImage: "hexagon") {
                        StoreView()
                    }
                    Tab("Favoritos", systemImage: "heart") {
                        FavoritesView()
                    }
                    Tab("Buscar", systemImage: "magnifyingglass", role:.search){
                        //tela de busca
                    }
                }
            }
        }
    }
}

#Preview {
    MainView()
        .modelContainer( // ✅
            for: [System.self],
            inMemory: true,
            sqliteDatabasePath: Bundle.main.path(forResource: "db", ofType: "sqlite")!
        )
}
