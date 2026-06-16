import SwiftUI
import SwiftData
import SwiftDataSQLite

struct StoreView: View {
    
    @Query var systems: [System]

    var body: some View {
        NavigationStack{
//            List{
//                ForEach(systems);label: do {
//                    StoreTrioView(category: "Flavio Bolsonaro", systems: systems)
//                }
//                    
//                }
            }
        Text("Hello, World!")
    }
}

#Preview {
    StoreView()
}
