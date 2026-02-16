//
//  ColorSection.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 16. 2. 2026..
//

import SwiftUI

struct ColorSection: View {
    @ObservedObject var viewModel: BreathViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            Text(L10n.BreathSettingsView.colorSectionTitle)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 12) {
                ColorPickerRow(
                    title: String(localized: L10n.BreathSettingsView.colorPickerTitleBackground),
                    color: $viewModel.backgroundColor,
                    icon: Icons.rectangle
                )
                
                ColorPickerRow(
                    title: String(localized: L10n.BreathSettingsView.colorPickerTitleCircle),
                    color: $viewModel.circleColor,
                    icon: Icons.circleFill
                )
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.white.opacity(0.1))
        )
    }
}
