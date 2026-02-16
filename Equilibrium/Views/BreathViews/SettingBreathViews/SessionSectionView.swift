//
//  SessionSectionView.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 16. 2. 2026..
//

import SwiftUI

struct SessionSectionView: View {
    @ObservedObject var viewModel: BreathViewModel
    var body: some View {
        VStack(spacing: 16) {
            Text(L10n.BreathSettingsView.sessionTitle)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            SettingSlider(
                title: String(localized: L10n.BreathSettingsView.sessionSliderTitle),
                value: Binding(
                    get: { Double(viewModel.totalCycles) },
                    set: { viewModel.totalCycles = Int($0) }
                ),
                range: 5...20,
                unit: String(localized: L10n.BreathSettingsView.sessionSliderUnit),
                icon: Icons.repeatCircleFill,
                step: 1
            )
            
            // Session duration
            HStack {
                Image(systemName: Icons.timer)
                    .foregroundColor(.cyan)
                let totalTime = Int((viewModel.inhaleTime + viewModel.holdTime * 2 + viewModel.exhaleTime) * Double(viewModel.totalCycles))
                let minutes = totalTime / 60
                let seconds = totalTime % 60
                let text = L10n.BreathSettingsView.totalSession(minutes: minutes, seconds: seconds)
                Text(text)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.white.opacity(0.8))
                Spacer()
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.white.opacity(0.1))
        )
    }
}
