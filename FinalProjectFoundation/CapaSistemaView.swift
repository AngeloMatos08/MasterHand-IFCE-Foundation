//
//  CapaSistemaView.swift
//  FinalProjectFoundation
//
//  Created by Found on 02/06/26.
//

import SwiftUI

struct CapaSistemaView: View {
    let cover: Data?
    
    var body: some View {
        ZStack{
            Color.gray
            Image(systemName:"hexagon.fill")
                .resizable()
                .scaledToFit()
                .frame(width:100,height:100)
        
            // se a capa existe -> exibe
            if let cover = cover,
               let uiImage = UIImage(data: cover) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
            }
        }
        .aspectRatio(16/26, contentMode: .fit)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    CapaSistemaView(
        cover: nil
    )
}
