//
//  BreathSettingsView.swift
//  Equilibrium
//
//  Created by Vlad on 30. 1. 2026..
//

import SwiftUI
import Combine

// MARK: - Breath Settings View
struct BreathSettingsView: View {
    @ObservedObject var viewModel: BreathViewModel
    @Environment(\.dismiss) private var dismiss
    @State private var showResetConfirmation = false
    
    var body: some View {
        NavigationView {
            ZStack {
                viewModel.backgroundColor
                    .ignoresSafeArea()
                    .animation(.easeInOut(duration: 0.3), value: viewModel.backgroundColor)
                
                ScrollView {
                    VStack(spacing: 24) {
                        // Preview
                        PreviewSection(viewModel: viewModel)
                        
                        // Timing settings
                        timingSection
                        
                        // Circle settings
                        circleSection
                        
                        // Color settings
                        ColorSection(viewModel: viewModel)
                        
                        // Session settings
                        SessionSectionView(viewModel: viewModel)
                        
                        // Reset button
                        resetButton
                    }
                    .padding()
                }
            }
            .navigationTitle(L10n.BreathSettingsView.breathTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(L10n.Common.close) {
                        dismiss()
                    }
                    .foregroundColor(.white)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(L10n.Common.done) {
                        viewModel.saveSettings()
                        dismiss()
                    }
                    .foregroundColor(.white)
                    .font(.body)
                   // .fontWeight(.bold)
                }
            }
        }
        .alert(L10n.BreathSettingsView.resetToDefaultsAsk, isPresented: $showResetConfirmation) {
            Button(L10n.Common.close, role: .cancel) {}
            Button(L10n.Common.reset, role: .destructive) {
                viewModel.resetToDefaults()
            }
        } message: {
            Text(L10n.BreathSettingsView.alertResetMessage)
        }
    }
    
    // MARK: - Timing Section
    private var timingSection: some View {
        VStack(spacing: 16) {
            Text(L10n.BreathSettingsView.breathTiming)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 12) {
                SettingSlider(
                    title: String(localized:L10n.BreathSettingsView.sliderInhale),
                    value: $viewModel.inhaleTime,
                    range: 2...8,
                    unit: String(localized:L10n.BreathSettingsView.sliderUnit),
                    icon: Icons.arrowUp
                )
                
                SettingSlider(
                    title: String(localized:L10n.BreathSettingsView.sliderHold),
                    value: $viewModel.holdTime,
                    range: 0...5,
                    unit: String(localized:L10n.BreathSettingsView.sliderUnit),
                    icon: Icons.pauseCircle
                )
                
                SettingSlider(
                    title: String(localized:L10n.BreathSettingsView.sliderExhale),
                    value: $viewModel.exhaleTime,
                    range: 2...10,
                    unit: String(localized:L10n.BreathSettingsView.sliderUnit),
                    icon: Icons.arrowDown
                )
            }
            
            // Total cycle time
            HStack {
                Image(systemName: Icons.clockFill)
                    .foregroundColor(.cyan)
                let cicles = Int(viewModel.inhaleTime + viewModel.holdTime * 2 + viewModel.exhaleTime)
                let text = L10n.BreathSettingsView.totalCicles(cicles)
                Text(text)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.white.opacity(0.8))
                Spacer()
            }
            .padding(.top, 8)
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.white.opacity(0.1))
        )
    }
    
    // MARK: - Circle Section
    private var circleSection: some View {
        VStack(spacing: 16) {
            Text(L10n.BreathSettingsView.circleSectionTitle)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            SettingSlider(
                title: String(localized: L10n.BreathSettingsView.circleSliderTitle),
                value: Binding<Double>(
                    get: { Double(viewModel.circleDiameter) },
                    set: { viewModel.circleDiameter = CGFloat($0) }
                ),
                range: 150...300,
                unit: String(localized: L10n.BreathSettingsView.circleSliderUnit),
                icon: Icons.circleFill,
                step: 10
            )
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.white.opacity(0.1))
        )
    }
    
    // MARK: - Reset Button
    private var resetButton: some View {
        Button(action: {
            showResetConfirmation = true
        }) {
            HStack {
                Image(systemName: Icons.arrowCounterclockwise)
                Text(L10n.BreathSettingsView.resetToDefaults)
            }
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(.white.opacity(0.15))
            )
        }
    }
}
