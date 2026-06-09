//
//  SystemsView.swift
//  FinalProjectFoundation
//
//  Created by Found on 02/06/26.
//

import SwiftUI

struct SystemsView: View {
    var body: some View {
        HStack{
            List{
                SystemCard()
            }
        }
    }
}

#Preview {
    SystemsView()
}
