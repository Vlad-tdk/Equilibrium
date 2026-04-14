//
//  BreathPresetsSection.swift
//  Equilibrium
//

import SwiftUI

struct BreathPresetsSection: View {
    @ObservedObject var viewModel: BreathViewModel

    var body: some View {
        VStack(spacing: 16) {
            Text("Presets")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)

            VStack(spacing: 10) {
                ForEach(BreathPreset.all) { preset in
                    presetRow(preset)
                }
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.white.opacity(0.1))
        )
    }

    private func isActive(_ preset: BreathPreset) -> Bool {
        viewModel.inhaleTime == preset.inhale &&
        viewModel.holdTime == preset.hold &&
        viewModel.exhaleTime == preset.exhale &&
        viewModel.totalCycles == preset.cycles
    }

    private func presetRow(_ preset: BreathPreset) -> some View {
        Button {
            withAnimation(.easeInOut(duration: 0.2)) {
                viewModel.applyPreset(preset)
            }
        } label: {
            HStack(spacing: 14) {
                Image(systemName: preset.icon)
                    .font(.system(size: 20))
                    .foregroundColor(isActive(preset) ? .cyan : .white.opacity(0.6))
                    .frame(width: 30)

                VStack(alignment: .leading, spacing: 2) {
                    Text(preset.name)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.white)
                    Text(preset.description)
                        .font(.system(size: 12))
                        .foregroundColor(.white.opacity(0.55))
                }

                Spacer()

                Text("\(Int(preset.inhale))-\(Int(preset.hold))-\(Int(preset.exhale))")
                    .font(.system(size: 13, weight: .medium, design: .monospaced))
                    .foregroundColor(.white.opacity(0.5))

                if isActive(preset) {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.cyan)
                        .font(.system(size: 18))
                }
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 12)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(isActive(preset) ? Color.cyan.opacity(0.15) : Color.white.opacity(0.06))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(isActive(preset) ? Color.cyan.opacity(0.5) : Color.clear, lineWidth: 1)
                    )
            )
        }
    }
}
