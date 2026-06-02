//
//  FavoritesCard.swift
//  FinalProjectFoundation
//
//  Created by Found on 02/06/26.
//
import SwiftUI
import SwiftData
import SwiftDataSQLite

struct FavoritesCard: View {
    @Query(sort: \Title.id, order: .forward) var titles: [Title]
    
//    @State private var filteredCategory: Category?
//    
//    var resultList: [Title] {
//        if let filteredCategory {
//            return titles.filter { title in
//                title.genres?.contains(filteredCategory) ?? false
//            }
//        }
//        
//        return titles
//    }

    var body: some View {
        if let first = titles.first {
            FavCardView(title: first)
        } else {
            Text("Nenhum título encontrado")
        }
    }
}

struct FavCardView: View {
    let title: Title

    var coverImage: Image {
        if let data = title.cover, let uiImage = UIImage(data: data) {
            return Image(uiImage: uiImage)
        }
        return Image(systemName: "photo")
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            coverImage
                .resizable()
                .aspectRatio(3/4, contentMode: .fill)
                .frame(width: 165, height: 259)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            VStack(alignment:.center){
                Text(title.name)
                    .font(.headline)
                    .frame(width: 164, alignment: .center)
                Text(title.genres?.count)
                    .font(.subheadline)
            }
        }
        .frame(width: 180)
    }
}

#Preview {
    FavoritesCard()
        .modelContainer(
            for: [Title.self],
            inMemory: true,
            sqliteDatabasePath: Bundle.main.path(forResource: "db", ofType: "sqlite")!
        )
}

