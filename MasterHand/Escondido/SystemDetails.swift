//
//  SystemDetailsView.swift
//  FinalProjectFoundation
//
//  Created by Found on 09/06/26.
//

import SwiftUI
import SwiftData
import SwiftDataSQLite

struct SystemDetails: View {
    @Environment(\.dismiss) var dismiss
    let system: System

    var body: some View {
        NavigationStack {
            ZStack {
                // Imagem de fundo específica para a tela de detalhes
                Image("DetailsBack")
                    .resizable()
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .center, spacing: 16) {
                        SystemCover(cover: system.cover)
                            .frame(width: 270)
                            .padding(.top)

                        Text(system.name)
                            .font(.title).bold()
                            .foregroundStyle(.mhbig)
                            .multilineTextAlignment(.center)

                        Text(system.getShowCategories())
                            .font(.headline)
                            .foregroundStyle(.mh)
                            .multilineTextAlignment(.center)


                        Text(system.desc)
                            .padding(.horizontal, 24)
                            .foregroundStyle(.white)

                        if let url = URL(string: system.storeLink) {
                            Link(destination: url) {
                                Text("Disponível em \(system.storeName)")
                                    .font(.footnote)
                                    .padding()
                                    .background(Color.mhbig.opacity(0.1))
                                    .cornerRadius(10)
                            }
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark").foregroundStyle(.mhbig)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                            system.isFavorite.toggle()
                        }
                    }
                    )
                    {
                        Image(systemName: system.isFavorite ? "heart.fill" : "heart")
                            .foregroundStyle(system.isFavorite ? .mhbig : .mhbig)
                    }
                }
            }
        }
    }
}
