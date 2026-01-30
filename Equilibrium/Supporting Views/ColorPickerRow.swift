//
//  ColorPickerRow.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 30. 1. 2026..
//

import SwiftUI

struct ColorPickerRow: View {
    let title: String
    @Binding var color: Color
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            
            Spacer()
            
            ColorPicker("", selection: $color)
                .labelsHidden()
        }
        .padding(.horizontal)
    }
}
