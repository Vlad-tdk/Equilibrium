//
//  SettingSlider.swift
//  Equilibrium
//
//  Created by Vlad on 30. 1. 2026..
//

import SwiftUI

// MARK: - Setting Slider
struct SettingSlider: View {
    let title: String
    @Binding var value: Double
    let range: ClosedRange<Double>
    let unit: String
    let icon: String
    var step: Int = 1
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.cyan)
                    .frame(width: 24)
                
                Text(title)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.white)
                
                Spacer()
                
                Text(String(format: step == 1 ? "%.0f" : "%.1f", value))
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
                
                Text(unit)
                    .font(.system(size: 14))
                    .foregroundColor(.white.opacity(0.7))
            }
            
            Slider(
                value: $value,
                in: range,
                step: Double.Stride(step)
            )
            .tint(.cyan)
        }
    }
}
