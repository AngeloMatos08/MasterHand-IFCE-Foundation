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
class System: Identifiable {
    var id: Int
    var name: String
    var cover: Data?
    var categories: [Category]?
    var categoryShow1: Category?
    var categoryShow2: Category?
    var storeLink: String
    var store_name: String
    var desc: String
    var price: Double?
    
    //metodo que retorna a sting com as showcategories
    func getShowCategories() -> String {
        let names = [categoryShow1?.name, categoryShow2?.name]
        
        let validNames = names
            .compactMap { $0 } // Remove qualquer valor nulo caso a categoria não exista
            .filter { !$0.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty } // Remove textos vazios
    
        return validNames.joined(separator: " | ")
    }
    
    init(id: Int, name: String, cover: Data?, categories: [Category]?, categoryShow1: Category?, categoryShow2: Category?, storeLink: String, store_name: String, desc: String, price: Double?) {
        self.id = id
        self.name = name
        self.cover = cover
        self.categories = categories
        self.categoryShow1 = categoryShow1
        self.categoryShow2 = categoryShow2
        self.storeLink = storeLink
        self.store_name = store_name
        self.desc = desc
        self.price = price
    }
}

@SQLiteTable("category")
@Model
class Category: Identifiable, Codable {
    var id: String
    var name: String
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
    
    // Coding Keys for Codable conformance
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
    
    // Required initializer for Decodable
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
    }
    
    // Required method for Encodable
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
    }
}
