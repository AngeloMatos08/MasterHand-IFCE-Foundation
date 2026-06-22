//
//  FinalProjectFoundationApp.swift
//  FinalProjectFoundation
//
//  Created by Beatriz Leonel on 28/05/26.
//

import SwiftUI
import SwiftDataSQLite

@main
struct MasterHandApp: App {
    // Estado para controlar se a Splash Screen deve ser exibida
    @State private var showSplashScreen = true

    var body: some Scene {
        WindowGroup {
            ZStack {
                if showSplashScreen {
                    // 1. Tela de Splash customizada
                    SplashView()
                        .transition(.opacity) // Transição suave de sumiço
                } else {
                    // 2. Tela principal do seu App
                    MainView()
                        .transition(.opacity) // Transição suave de aparecimento
                }
            }
            // Aplica a animação sempre que o estado "showSplashScreen" mudar
            .animation(.easeInOut(duration: 0.6), value: showSplashScreen)
            .onAppear {
                // Aguarda 2 segundos e esconde a splash screen na thread principal
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    showSplashScreen = false
                }
            }
            .modelContainer(
                for: [System.self, Category.self],
                inMemory: true,
                sqliteDatabasePath: Bundle.main.path(forResource: "db", ofType: "sqlite")!
            )
        }
    }
}

// MARK: - Splash Screen View
struct SplashView: View {
    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            
            // Usando o nome correto da imagem: MhLogo
            Image("MhLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 180, height: 180)
                .shadow(color: Color.mhbig.opacity(0.3), radius: 12, x: 0, y: 8)
            
            Spacer()
            
            // Indicador de carregamento (ProgressView)
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .white)) // Cor branca garante visibilidade no fundo escuro
                .scaleEffect(1.5)
                .padding(.bottom, 50)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) // Garante que a VStack ocupe exatamente a tela do celular
        .background(
            // Colocamos o fundo usando o modificador .background para evitar que ele estoure o layout
            Image("Back")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        )
    }
}
