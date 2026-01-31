//
//  BreathSettingsView.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 30. 1. 2026..
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
                        previewSection
                        
                        // Timing settings
                        timingSection
                        
                        // Circle settings
                        circleSection
                        
                        // Color settings
                        colorSection
                        
                        // Session settings
                        sessionSection
                        
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
    
    // MARK: - Preview Section
    private var previewSection: some View {
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
                    .frame(width: viewModel.circleDiameter * 0.6, height: viewModel.circleDiameter * 0.6)
                
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
                    .frame(width: viewModel.circleDiameter * 0.5, height: viewModel.circleDiameter * 0.5)
                    .shadow(color: viewModel.circleColor.opacity(0.5), radius: 10, x: 0, y: 0)
            }
            .frame(height: 200)
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.white.opacity(0.1))
        )
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
    
    // MARK: - Color Section
    private var colorSection: some View {
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
    
    // MARK: - Session Section
    private var sessionSection: some View {
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
