//
//  FavoritesCard.swift
//  FinalProjectFoundation
//
//  Created by Found on 02/06/26.
//
import SwiftUI
import SwiftData
import SwiftDataSQLite

struct SystemDefaultCard: View {
    let system: System
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            SystemCover(cover: system.cover)
                .frame(width: 165)
            
            VStack(alignment: .center, spacing: 4) {
                Text(system.name)
                    .font(.headline)
                    .frame(width: 165, alignment: .center)
                    .lineLimit(1)
                
                HStack(spacing: 6) {
                    Text(system.getShowCategories())
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .minimumScaleFactor(0.8)
                        .frame(width: 165, height: 32, alignment: .top)
                }
                .font(.subheadline)
            }
        }
        .frame(width: 180)
    }
}

