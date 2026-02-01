//
//  BreathView.swift
//  Equilibrium
//
//  Created by Vlad on 30. 1. 2026..
//

import SwiftUI
import Combine

struct BreathView: View {
    @StateObject private var viewModel = BreathViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            // Background
            viewModel.backgroundColor
                .ignoresSafeArea()
                .animation(.easeInOut(duration: 0.3), value: viewModel.backgroundColor)
            
            VStack {
                if !viewModel.isAnimating {
                    // Header with settings button
                    HStack {
                        Button(action: { dismiss() }) {
                            Image(systemName: Icons.leftArrow)
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(.white)
                                .padding()
                        }
                        
                        Spacer()
                        
                        Button(action: { viewModel.showSettings = true }) {
                            Image(systemName: Icons.sliderHorizontal)
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(.white)
                                .padding()
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top)
                }
                
                Spacer()
                
                // Breathing circle
                ZStack {
                    // Outer glow
                    Circle()
                        .fill(
                            RadialGradient(
                                colors: [
                                    viewModel.circleColor.opacity(0.3),
                                    viewModel.circleColor.opacity(0)
                                ],
                                center: .center,
                                startRadius: 50,
                                endRadius: 150
                            )
                        )
                        .frame(width: viewModel.circleDiameter * 1.5, height: viewModel.circleDiameter * 1.5)
                        .scaleEffect(viewModel.scale * 1.2)
                    
                    // Main circle
                    Circle()
                        .fill(
                            RadialGradient(
                                colors: [
                                    viewModel.circleColor,
                                    viewModel.circleColor.opacity(0.8)
                                ],
                                center: .center,
                                startRadius: 0,
                                endRadius: 100
                            )
                        )
                        .frame(width: viewModel.circleDiameter, height: viewModel.circleDiameter)
                        .scaleEffect(viewModel.scale)
                        .shadow(color: viewModel.circleColor.opacity(0.5), radius: 20, x: 0, y: 0)
                    
                    // Instruction text
                    if viewModel.isAnimating {
                        VStack(spacing: 8) {
                            Text(viewModel.breathPhase)
                                .font(.system(size: 28, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 2)
                            
                            Text(L10n.BreathView.phaseTimeRemaining(viewModel.phaseTimeRemaining))
                                .font(.system(size: 20, weight: .medium))
                                .foregroundColor(.white.opacity(0.8))
                        }
                    }
                }
                
                Spacer()
                
                // Start/Stop button
                if !viewModel.isAnimating {
                    VStack(spacing: 16) {
                        Text(L10n.BreathView.textTitle)
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                        
                        Text(L10n.BreathView.textSubTitle)
                            .font(.system(size: 16))
                            .foregroundColor(.white.opacity(0.8))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 40)
                        
                        // Current settings info
                        HStack(spacing: 20) {
                            SettingBadge(
                                icon: Icons.arrowUpArrowDown,
                                value: L10n.BreathView.settingBadgeTime(viewModel.inhaleTime),
                                label: String(localized: L10n.BreathView.inhale               )             )
                            
                            SettingBadge(
                                icon: Icons.pauseCircle,
                                value: L10n.BreathView.settingBadgeTime(viewModel.holdTime) ,
                                label: String(localized:L10n.BreathView.hold)
                            )
                            
                            SettingBadge(
                                icon: Icons.arrowDownToLine,
                                value:L10n.BreathView.settingBadgeTime(viewModel.exhaleTime),
                                label: String(localized:L10n.BreathView.exhale)
                            )
                        }
                        .padding(.vertical)
                        
                        Button(action: {
                            viewModel.startBreathing()
                        }) {
                            Text(L10n.BreathView.startButtonTitle)
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.white)
                                .frame(width: 200, height: 60)
                                .background(
                                    Colors.gradientBreathButton
                                )
                                .cornerRadius(30)
                                .shadow(color: Colors.shadowBreathButtonColor, radius: 10, x: 0, y: 5)
                        }
                        .padding(.top, 20)
                    }
                    .padding(.bottom, 50)
                } else {
                    VStack(spacing: 16) {
                        // Progress
                        Text(L10n.BreathView.cycleProgress(viewModel.currentCycle, viewModel.totalCycles))
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.white.opacity(0.8))
                        
                        Button(action: {
                            viewModel.stopBreathing()
                        }) {
                            Text(L10n.BreathView.stopButtonTitle)
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(.white)
                                .frame(width: 160, height: 50)
                                .background(
                                    Capsule()
                                        .fill(.white.opacity(0.2))
                                )
                        }
                    }
                    .padding(.bottom, 50)
                }
            }
        }
        .navigationBarHidden(true)
        .sheet(isPresented: $viewModel.showSettings) {
            BreathSettingsView(viewModel: viewModel)
        }
    }
}

// MARK: - Preview
#Preview {
    BreathView()
}
