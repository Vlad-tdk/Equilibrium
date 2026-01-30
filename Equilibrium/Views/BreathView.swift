//
//  BreathView.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 30. 1. 2026..
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
            
            VStack {
                if !viewModel.isAnimating {
                    // Header with settings button
                    HStack {
                        Button(action: { dismiss() }) {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(.white)
                                .padding()
                        }
                        
                        Spacer()
                        
                        Button(action: { viewModel.showSettings = true }) {
                            Image(systemName: "slider.horizontal.3")
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
                        .frame(width: 300, height: 300)
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
                        .frame(width: 200, height: 200)
                        .scaleEffect(viewModel.scale)
                        .shadow(color: viewModel.circleColor.opacity(0.5), radius: 20, x: 0, y: 0)
                    
                    // Instruction text
                    if viewModel.isAnimating {
                        Text(viewModel.breathPhase)
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 2)
                    }
                }
                
                Spacer()
                
                // Start/Stop button
                if !viewModel.isAnimating {
                    VStack(spacing: 16) {
                        Text("Breathing Training")
                            .font(.system(size: 28, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                        
                        Text("Find peace through controlled breathing")
                            .font(.system(size: 16))
                            .foregroundColor(.white.opacity(0.8))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 40)
                        
                        Button(action: {
                            viewModel.startBreathing()
                        }) {
                            Text("START")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.white)
                                .frame(width: 200, height: 60)
                                .background(
                                    LinearGradient(
                                        colors: [Color(hex: "6DD4FF"), Color(hex: "4A90E2")],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .cornerRadius(30)
                                .shadow(color: Color(hex: "4A90E2").opacity(0.4), radius: 10, x: 0, y: 5)
                        }
                        .padding(.top, 20)
                    }
                    .padding(.bottom, 50)
                } else {
                    Button(action: {
                        viewModel.stopBreathing()
                    }) {
                        Text("STOP")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                            .frame(width: 160, height: 50)
                            .background(
                                Capsule()
                                    .fill(.white.opacity(0.2))
                            )
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
