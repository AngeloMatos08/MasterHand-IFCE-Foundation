//
//  SystemStoreCard.swift
//  FinalProjectFoundation
//
//  Created by Found on 02/06/26.
//
import SwiftUI
import SwiftData
import SwiftDataSQLite

struct SystemStoreCard: View {
    let system: System
    
    // 1. Criamos um estado privado para controlar se a sheet deve ser exibida ou não.
    // Começa como 'false' porque a tela de detalhes inicia fechada.
    @State private var isShowingDetails = false

    var body: some View {
        // 2. Transformamos o contêiner principal em um Button.
        // Ao ser clicado, ele altera o estado 'isShowingDetails' para true.
        Button(action: {
            isShowingDetails = true
        }) {
            // Frame com a capa e o frame dos textos (conteúdo visual do card)
            VStack(alignment: .leading, spacing: 8) {
                SystemCover(cover: system.cover)
                    .frame(width: 120)
                
                // frame dos textos
                VStack(alignment: .leading, spacing: 4) {
                    
                    // Título do sistema
                    Text(system.name)
                        .font(.headline)
                        .foregroundStyle(.black)
                        .lineLimit(2) // Limita a 2 linhas para não quebrar o layout se o nome for gigante
                        .frame(width: 120, height: 44, alignment: .topLeading)

                    Group {
                        if let price = system.price {
                            if price == 0 {
                                Text("Gratuito")
                            } else {
                                Text(price.formatted(.currency(code: "BRL")))
                            }
                        } else {
                            Text("Preço indisponível")
                        }
                    }
                    .font(.footnote)
                    .foregroundStyle(.black)

                }
            }
            .frame(width: 120)
        }
        // 3. O estilo .plain impede que o SwiftUI pinte os textos de azul (comportamento padrão de botões)
        .buttonStyle(.plain)
        
        // 4. O modificador .sheet monitora o estado '$isShowingDetails'.
        // Quando ele for true, ele apresenta a view informada no bloco.
        .sheet(isPresented: $isShowingDetails) {
            SystemDetails(system: system)
        }
    }
}

#Preview {
    let sample = System(
        id: 1,
        name: "Ordem Paranormal",
        cover: nil,
        categoryShow1: "Terror",
        categoryShow2: "Investigação",
        storeLink: "https://www.apple.com",
        storeName: "Loja Oficial",
        desc: "Este é um exemplo de descrição para testar como o conteúdo aparece dentro da sheet. O layout deve ser scrollável caso o texto seja muito longo. AAAAAAAAAAAAAAAAAAA",
        price: 99.90
    )
    
    SystemDefaultCard(system: sample)
    
    .modelContainer( // ✅
        for: [System.self],
        inMemory: true,
        sqliteDatabasePath: Bundle.main.path(forResource: "db", ofType: "sqlite")!
    )
}
