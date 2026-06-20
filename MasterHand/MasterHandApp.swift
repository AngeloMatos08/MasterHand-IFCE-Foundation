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
    var body: some Scene {
        WindowGroup {
            MainView()
                .modelContainer( // ✅
                    for: [System.self, Category.self],
                    inMemory: true,
                    sqliteDatabasePath: Bundle.main.path(forResource: "db", ofType: "sqlite")!
                )
        }
    }
}
