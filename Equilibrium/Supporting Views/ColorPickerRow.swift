//
//  ColorPickerRow.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 30. 1. 2026..
//

import SwiftUI

// MARK: - Color Picker Row
struct ColorPickerRow: View {
    let title: String
    @Binding var color: Color
    let icon: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.cyan)
                .frame(width: 24)
            
            Text(title)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            
            Spacer()
            
            ColorPicker("", selection: $color)
                .labelsHidden()
        }
    }
}
