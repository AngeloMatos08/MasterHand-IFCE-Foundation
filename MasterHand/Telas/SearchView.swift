//
//  SearchView.swift
//  FinalProjectFoundation
//
//  Created by Found on 19/06/26.
//

import SwiftUI
import SwiftData
import SwiftDataSQLite

struct SearchView: View {
    @Query var allSystems: [System]
    @State private var searchText = ""
    @State private var selectedSystem: System?
    
    // Grid de duas colunas para os itens relacionados
    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    // FILTRO FLEXÍVEL: Centraliza a lógica de busca para facilitar mudanças futuras (ex: categorias)
    private func matchesFilter(_ system: System) -> Bool {
        if searchText.isEmpty {
            return false // Não filtra nada se estiver vazio (mostra tela inicial limpa)
        }
        
        let searchLower = searchText.lowercased()
        
        // Busca no nome do sistema
        if system.name.localizedCaseInsensitiveContains(searchText) {
            return true
        }
        
        // Busca nas categorias relacionadas (novo relacionamento)
        for category in system.categories {
            if category.name.localizedCaseInsensitiveContains(searchText) {
                return true
            }
        }
        
        // Fallback: Busca nos showcase categories (dados legados)
        let showcaseCategories = system.getShowCategories()
        if showcaseCategories.localizedCaseInsensitiveContains(searchText) {
            return true
        }
        
        return false
    }
    
    // Filtra e divide os resultados em "Destaque" (primeiro item) e "Relacionados" (resto)
    private var filteredSystems: [System] {
        allSystems.filter(matchesFilter)
    }
    
    private var topFeaturedSystem: System? {
        filteredSystems.first
    }
    
    private var relatedSystems: [System] {
        Array(filteredSystems.dropFirst())
    }
    
    var body: some View {
        ZStack {
    
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    HStack {
                        Text("Buscar")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.mhbig)
                        Spacer()
                    }
                    .padding(.leading, 25)
                    // Campo de Busca Customizado
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        
                        TextField("", text: $searchText, prompt: Text("Buscar por nome ou categoria...").foregroundStyle(.mhbig))
                            .foregroundColor(.white)
                            .autocorrectionDisabled()
                            .textInputAutocapitalization(.never)
                        
//                        TextField("Buscar por nome ou categoria...", text: $searchText)
                            
                        
                        if !searchText.isEmpty {
                            Button(action: { searchText = "" }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .padding(12)
                    .background(Color.white.opacity(0.12))
                    .cornerRadius(12)
                    .padding(.horizontal, 20)
                    
                    // --- GERENCIAMENTO DE ESTADOS DA TELA ---
                    
                    if searchText.isEmpty {
                        // 1. TELA INICIAL (Antes de digitar)
                        VStack(spacing: 16) {
                            Image(systemName: "sparkles")
                                .font(.system(size: 48))
                                .foregroundColor(.mhbig.opacity(0.6))
                                .padding(.top, 60)
                            
                            Text("Descubra Novos Mundos")
                                .font(.headline)
                                .foregroundColor(.mhbig)
                            
                            Text("Digite o nome de um sistema ou uma categoria para começar a sua busca.")
                                .font(.subheadline)
                                .foregroundColor(.mh.opacity(0.8))
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 40)
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        
                    } else if filteredSystems.isEmpty {
                        // 2. NENHUM RESULTADO ENCONTRADO
                        ContentUnavailableView(
                            "Nenhum sistema encontrado",
                            systemImage: "magnifyingglass",
                            description: Text("Tente buscar por outro nome ou categoria.")
                        )
                        .padding(.top, 40)
                        .foregroundColor(.mh)
                        
                    } else {
                        // 3. RESULTADOS DA BUSCA (Destaque + Relacionados)
                        
                        // Destaque do Topo (Primeiro resultado)
                        if let featured = topFeaturedSystem {
                            VStack(spacing: 12) {
                                Button(action: {
                                    selectedSystem = featured
                                }) {
                                    VStack(spacing: 8) {
                                        SystemCover(cover: featured.cover)
                                            .frame(width: 200)
                                            .padding(4)
                                        
                                        Text(featured.name)
                                            .font(.title3)
                                            .bold()
                                            .foregroundStyle(.mhbig)
                                            .multilineTextAlignment(.center)
                                        
                                        Text(featured.getShowCategories())
                                            .font(.subheadline)
                                            .foregroundStyle(.mh)
                                            .multilineTextAlignment(.center)
                                    }
                                }
                                .buttonStyle(.plain)
                            }
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.top, 8)
                        }
                        
                        // Relacionados (Restante dos resultados em Grid de 2 colunas)
                        if !relatedSystems.isEmpty {
                            VStack(alignment: .leading, spacing: 16) {
                                Text("Relacionados")
                                    .font(.title2)
                                    .bold()
                                    .foregroundColor(.mhbig)
                                    .padding(.horizontal, 20)
                                
                                LazyVGrid(columns: columns, spacing: 24) {
                                    ForEach(relatedSystems) { system in
                                        Button(action: {
                                            selectedSystem = system
                                        }) {
                                            SystemDefaultCard(system: system)
                                        }
                                        .buttonStyle(.plain)
                                    }
                                }
                                .padding(.horizontal, 16)
                            }
                        }
                    }
                }
                .padding(.vertical, 16)
                
                
                //                // O frame com minHeight garante que a VStack ocupe pelo menos a altura inteira da tela,
                //                // evitando que o fundo corte ou encolha quando a busca estiver vazia.
                //                .frame(maxWidth: .infinity, minHeight: geometry.size.height, alignment: .topLeading)
            }
        }
        .background {
            Image("Back")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .clipShape (
                    Rectangle()
                )
        }
        // Abre a sheet de detalhes do sistema selecionado
        .sheet(item: $selectedSystem) { system in
            SystemDetails(system: system)
        }
//        .toolbarColorScheme(.dark, for: .automatic)
    }
}

#Preview {
    SearchView()
        .modelContainer(
            for: [System.self, Category.self],
            inMemory: true,
            sqliteDatabasePath: Bundle.main.path(forResource: "db", ofType: "sqlite")!
        )
}
