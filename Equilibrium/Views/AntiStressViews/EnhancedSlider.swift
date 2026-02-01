//
//  EnhancedSlider.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 1. 2. 2026..
//

import SwiftUI

// MARK: - Enhanced Slider
struct EnhancedSlider: View {
    let title: LocalizedStringResource
    @Binding var value: CGFloat
    let range: ClosedRange<CGFloat>
    let unit: LocalizedStringResource
    let icon: String
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: icon)
                    .font(.system(size: 14))
                    .foregroundColor(color)
                    .frame(width: 20)
                
                Text(String(localized: title))
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.white.opacity(0.9))
                
                Spacer()
                
                Text(String(format: "%.1f", value))
                    .font(.system(size: 14, weight: .bold, design: .monospaced))
                    .foregroundColor(color)
                
                Text(unit)
                    .font(.system(size: 12))
                    .foregroundColor(.white.opacity(0.6))
                    .frame(width: 20, alignment: .leading)
            }
            
            Slider(value: $value, in: range)
                .tint(color)
        }
        .padding(.vertical, 4)
    }
}
