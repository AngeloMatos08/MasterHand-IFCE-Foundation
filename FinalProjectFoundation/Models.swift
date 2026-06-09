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
    
    // 1. Declaramos as duas colunas individuais que existem no seu banco de dados SQLite
    var genre1: String = ""
    var genre2: String = ""
    
//    var storeLink: String
//    var store_name: String
//    var desc: String
    var price: Double?
    
    // 2. A função agora encontra 'genre1' e 'genre2' declarados acima e compila perfeitamente
    func getGenreList() -> [String] {
        return [genre1, genre2]
            .compactMap { $0 } // Remove tudo o que for 'nil' (nulo) e transforma [String?] em [String]
            .filter { !$0.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty } // Filtra strings vazias
    }
    
    // 3. Atualizamos o construtor para aceitar os dois gêneros individualmente
    init(id: Int, name: String, cover: Data?, genre1: String, genre2: String, /*storeLink: String, store_name: String, desc: String,*/ price: Double?) {
        self.id = id
        self.name = name
        self.cover = cover
        self.genre1 = genre1
        self.genre2 = genre2
//        self.storeLink = storeLink
//        self.store_name = store_name
//        self.desc = desc
        self.price = price
    }
}
