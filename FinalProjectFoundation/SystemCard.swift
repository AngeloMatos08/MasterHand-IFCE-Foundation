//
//  SystemCard.swift
//  FinalProjectFoundation
//
//  Created by Found on 02/06/26.
//
import SwiftUI
import SwiftData
import SwiftDataSQLite

struct SystemCard: View {
    @Query(sort: \Title.id, order: .forward) var titles: [Title]

    var body: some View {
        if let first = titles.first {
            CardView(title: first)
        } else {
            Text("Nenhum título encontrado")
        }
    }
}

struct CardView: View {
    let title: Title

    var coverImage: Image {
        if let data = title.cover, let uiImage = UIImage(data: data) {
            return Image(uiImage: uiImage)
        }
        return Image(systemName: "photo")
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            coverImage
                .resizable()
                .aspectRatio(3/4, contentMode: .fill)
                .frame(width: 119, height: 186)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            VStack(alignment:.leading){
                Text(title.name)
                    .font(.headline)
                    .frame(width: 119, height: 44, alignment: .leading)

                Text(title.price != nil ? title.price!.formatted(.currency(code: "BRL")) : "Preço indisponível")
                    .font(.footnote)
            }
        }
        .frame(width: 180)
    }
}

#Preview {
    SystemCard()
        .modelContainer(
            for: [Title.self],
            inMemory: true,
            sqliteDatabasePath: Bundle.main.path(forResource: "db", ofType: "sqlite")!
        )
}
