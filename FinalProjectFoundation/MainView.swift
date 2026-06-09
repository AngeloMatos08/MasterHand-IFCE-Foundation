import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack(){
            HStack{
                TabView {
                    Tab("Sistemas", systemImage: "hexagon") {
                        //tela dos sistemas
                    }
                    Tab("Favoritos", systemImage: "heart") {
                        //tela favoritos
                    }
                    Tab("Buscar", systemImage: "magnifyingglass", role:.search){
                        //tela de busca
                    }
                }
            }.padding(.horizontal, 20)
        }
    }
}

#Preview {
    MainView()
}
