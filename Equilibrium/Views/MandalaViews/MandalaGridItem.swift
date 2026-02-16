//
//  MandalaGridItem.swift
//  Equilibrium
//
//  Created by Vlad on 30. 1. 2026..
//

import SwiftUI

// MARK: - Mandala Grid Item
struct MandalaGridItem: View {
    let imageName: String
    let isSelected: Bool
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(width: 100, height: 100)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(
                        isSelected ? .selected : .unselected,
                        lineWidth: isSelected ? 3 : 0
                    )
            )
            .shadow(color: isSelected ? .shadowSelected : .shadowUnselected, radius: 8, x: 0, y: 4)
            .scaleEffect(isSelected ? 1.05 : 1.0)
            .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isSelected)
    }
}
