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
            ScrollView {
                VStack(spacing: 16) {
                    SystemCover(cover: system.cover)
                        .frame(width: 200)
                        .padding(.top)

                    Text(system.name)
                        .font(.title2).bold()

                    Text(system.getShowCategories())
                        .font(.subheadline)

                    Text(system.desc)
                        .padding()

                    if let url = URL(string: system.storeLink) {
                        Link(destination: url) {
                            Text("Disponível em: \(system.storeName)")
                                .font(.footnote)
                                .padding()
                                .background(Color.blue.opacity(0.1))
                                .cornerRadius(10)
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark.circle.fill").foregroundStyle(.gray)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                            system.isFavorite.toggle()
                        }
                    }) {
                        Image(systemName: system.isFavorite ? "heart.fill" : "heart")
                            .foregroundStyle(system.isFavorite ? .red : .gray)
                    }
                }
            }
        }
    }
}
