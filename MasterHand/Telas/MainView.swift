import SwiftUI
import SwiftData
import SwiftDataSQLite

struct MainView: View {
    var body: some View {
        TabView {
            Tab("Sistemas", systemImage: "hexagon") {
                StoreView()
            }
            Tab("Favoritos", systemImage: "heart") {
                FavoritesView()
            }
            Tab("Buscar", systemImage: "magnifyingglass", role: .search) {
                SearchView()
            }
        }
        .tint(.mh)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    MainView()
        .modelContainer(
            for: [System.self, Category.self],
            inMemory: true,
            sqliteDatabasePath: Bundle.main.path(forResource: "db", ofType: "sqlite")!
        )
}
