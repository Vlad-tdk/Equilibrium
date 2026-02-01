//
//  FireSelectionItem.swift
//  Equilibrium
//
//  Created by Vlad on 30. 1. 2026..
//

import SwiftUI

// MARK: - Fire Selection Item
struct FireSelectionItem: View {
    let imageName: String
    let isSelected: Bool
    
    var body: some View {
        GIFImageView(gifName: imageName, contentMode: .scaleAspectFit)
            .frame(width: 105, height: 160)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(
                        isSelected ? Color.orange : Color.clear,
                        lineWidth: isSelected ? 3 : 0
                    )
            )
        
    }
}
