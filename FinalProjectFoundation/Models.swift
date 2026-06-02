//
//  Models.swift
//  FinalProjectFoundation
//
//  Created by Found on 02/06/26.
//
import Foundation
import SwiftData
import SwiftDataSQLite

@SQLiteTable("system")
@Model
class Title: Identifiable {
    var id: Int
    var name: String
    var cover: Data?
    var genres: [Category]?
//    var storeLink: String
//    var store_name: String
//    var desc: String
    var price: Double?
    
    init(
        id: Int,
        name: String,
        cover: Data?,
        genres: [Category]?,
        price: Double?
        /*storeLink: String, store_name: String, desc: String,*/
    ) {
        self.id = id
        self.name = name
        self.cover = cover
        self.genres = genres
//        self.storeLink = storeLink
//        self.store_name = store_name
//        self.desc = desc
        self.price = price
    }
}

enum Category: String, Codable {
    case terror
    case fantasy
    case action
    case adventure
}


