//
//  PreviewSection.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 16. 2. 2026..
//

import SwiftUI

struct PreviewSection: View {
    @ObservedObject var viewModel: BreathViewModel
    var body: some View {
        VStack(spacing: 16) {
            Text(L10n.BreathSettingsView.preview)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ZStack {
                // Animated preview
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                viewModel.circleColor.opacity(0.3),
                                viewModel.circleColor.opacity(0)
                            ],
                            center: .center,
                            startRadius: 30,
                            endRadius: 80
                        )
                    )
                    .frame(
                        width: viewModel.circleDiameter * 0.6,
                        height: viewModel.circleDiameter * 0.6
                    )
                
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                viewModel.circleColor,
                                viewModel.circleColor.opacity(0.8)
                            ],
                            center: .center,
                            startRadius: 0,
                            endRadius: 50
                        )
                    )
                    .frame(
                        width: viewModel.circleDiameter * 0.5,
                        height: viewModel.circleDiameter * 0.5
                    )
                    .shadow(
                        color: viewModel.circleColor.opacity(0.5),
                        radius: 10, x: 0, y: 0
                    )
            }
            .frame(height: 200)
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.white.opacity(0.1))
        )
    }
}
