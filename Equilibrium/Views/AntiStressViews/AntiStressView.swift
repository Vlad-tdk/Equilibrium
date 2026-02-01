//
//  AntiStressView.swift
//  Equilibrium
//
//  Created by Vlad on 30. 1. 2026..
//

import SwiftUI

struct AntiStressView: View {
    @StateObject private var effectModel = ParticleEffectModel()
    @State private var showControlPanel = false
    @State private var showPhysicsGuide = false
    @Environment(\.dismiss) private var dismiss
    
    @State private var sessionStartTime: Date? = nil
    @State private var interactionCount: Int = 0
    
    var body: some View {
        ZStack {
            // Gradient background instead of plain black
            LinearGradient(
                colors: [
                    Color(hex: "0f0c29"),
                    Color(hex: "302b63"),
                    Color(hex: "24243e")
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            GeometryReader { geometry in
                ParticleCanvas(
                    particles: effectModel.particles,
                    size: effectModel.particleSize
                )
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged { value in
                            effectModel.interactionPoint = value.location
                        }
                        .onEnded { _ in
                            effectModel.interactionPoint = CGPoint(x: -1000, y: -1000)
                            interactionCount += 1
                        }
                )
                .onAppear {
                    sessionStartTime = Date()
                    interactionCount = 0
                    effectModel.setupParticles(for: geometry.size)
                    
                }
                .onChange(of: geometry.size) { newSize in
                    effectModel.setupParticles(for: newSize)
                }
            }
            
            // Interaction point glow effect
            if effectModel.interactionPoint.x > 0 && effectModel.interactionPoint.y > 0 {
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                Color.cyan.opacity(0.3),
                                Color.cyan.opacity(0.1),
                                Color.clear
                            ],
                            center: .center,
                            startRadius: 0,
                            endRadius: effectModel.interactionRadius
                        )
                    )
                    .frame(width: effectModel.interactionRadius * 2, height: effectModel.interactionRadius * 2)
                    .position(effectModel.interactionPoint)
                    .allowsHitTesting(false)
            }
            
            // UI Overlay
            VStack {
                // Top bar
                if !showControlPanel {
                    topBar
                }
                
                Spacer()
                
                // Control panel
                if showControlPanel {
                    controlPanel
                }
            }
        }
        .navigationBarHidden(true)
        .sheet(isPresented: $showPhysicsGuide) {
            PhysicsGuideView()
        }
        .onDisappear {
            if let startTime = sessionStartTime {
                let duration = Date().timeIntervalSince(startTime)
                StatisticsManager.shared.trackAntiStressSession(
                    duration: duration,
                    interactions: interactionCount
                )
            }
        }
    }
    
    // MARK: - Top Bar
    private var topBar: some View {
        HStack {
            Button(action: { dismiss() }) {
                Image(systemName: Icons.leftArrow)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)
                    .padding()
            }
            
            Spacer()
            
            Text(L10n.AntiStressView.title)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .foregroundColor(.white)
            
            Spacer()
            
            HStack(spacing: 16) {
                Button(action: { showPhysicsGuide = true }) {
                    Image(systemName: Icons.infoCircle)
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.white)
                }
                
                Button(action: {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                        showControlPanel.toggle()
                    }
                }) {
                    Image(systemName: showControlPanel ? Icons.xmark : Icons.sliderHorizontal)
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal)
        }
        .padding(.top)
        .background(
            LinearGradient(
                colors: [Color.black.opacity(0.5), Color.clear],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea(edges: .top)
        )
    }
    
    // MARK: - Control Panel
    private var controlPanel: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Title
                HStack {
                    Text(L10n.AntiStressView.physicsControls)
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                            showControlPanel = false
                        }
                    }) {
                        Image(systemName: Icons.xmarkCircleFill)
                            .font(.system(size: 24))
                            .foregroundColor(.white.opacity(0.7))
                    }
                }
                .padding(.bottom, 8)
                
                // Visual settings
                visualSection
                
                // Force settings
                forceSection
                
                // Physics settings
                physicsSection
                
                // Presets
                presetsSection
                
                // Reset button
                Button(action: {
                    effectModel.resetToDefaults()
                }) {
                    HStack {
                        Image(systemName: Icons.arrowCounterclockwise)
                        Text(L10n.AntiStressView.resetToDefaults)
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
            .padding()
        }
        .frame(maxHeight: UIScreen.main.bounds.height * 0.8)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(.black.opacity(0.85))
                .overlay(
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(Color.cyan.opacity(0.3), lineWidth: 1)
                )
        )
        .padding()
    }
    
    // MARK: - Visual Section
    private var visualSection: some View {
        VStack(spacing: 12) {
            SectionHeader(title: L10n.AntiStressView.vsSectionHeaderTitle, icon: Icons.sparkles)
            
            EnhancedSlider(
                title: L10n.AntiStressView.vsEnchasedParticleSize,
                value: $effectModel.particleSize,
                range: 2...12,
                unit: L10n.AntiStressView.vsEnchasedUnitPt,
                icon: Icons.circleFill,
                color: .cyan
            )
            
            EnhancedSlider(
                title: L10n.AntiStressView.vsEnchasedSpacing,
                value: $effectModel.particleSpacing,
                range: 5...15,
                unit: L10n.AntiStressView.vsEnchasedUnitPt,
                icon: Icons.squareGrid,
                color: .purple
            )
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(.white.opacity(0.05))
        )
    }
    
    // MARK: - Force Section
    private var forceSection: some View {
        VStack(spacing: 12) {
            SectionHeader(title: L10n.AntiStressView.fsSectionHeaderTitle, icon: Icons.handPointUpLeftFill)
            
            EnhancedSlider(
                title: L10n.AntiStressView.fsEnchasedInteractionRadius,
                value: $effectModel.interactionRadius,
                range: 20...200,
                unit: L10n.AntiStressView.fsEnchasedUnitPt,
                icon: Icons.circleDotted,
                color: .orange
            )
            
            EnhancedSlider(
                title: L10n.AntiStressView.fsEnchasedForceStrength,
                value: $effectModel.forceStrength,
                range: 5...50,
                unit: L10n.AntiStressView.fsEnchasedUnitN,
                icon: Icons.boltFill,
                color: .yellow
            )
            
            EnhancedSlider(
                title: L10n.AntiStressView.fsEnchasedForceSmoothness,
                value: $effectModel.forceSmoothness,
                range: 0.1...1.0,
                unit: "",
                icon: Icons.waveform,
                color: .green
            )
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(.white.opacity(0.05))
        )
    }
    
    // MARK: - Physics Section
    private var physicsSection: some View {
        VStack(spacing: 12) {
            SectionHeader(title: L10n.AntiStressView.psSectionHeaderTitle, icon: Icons.atom)
            
            EnhancedSlider(
                title: L10n.AntiStressView.psEnchasedVelocityFactor,
                value: $effectModel.particleVelocityFactor,
                range: 0.1...3.0,
                unit: L10n.AntiStressView.psEnchasedUnitX,
                icon: Icons.speedometer,
                color: .blue
            )
            
            EnhancedSlider(
                title: L10n.AntiStressView.psEnchasedFriction,
                value: $effectModel.friction,
                range: 0.5...0.95,
                unit: "",
                icon: Icons.wind,
                color: .indigo
            )
            
            EnhancedSlider(
                title: L10n.AntiStressView.psEnchasedSpringStrength,
                value: $effectModel.springStrength,
                range: 0.01...1.0,
                unit: L10n.AntiStressView.psEnchasedUnitK,
                icon: Icons.arrowTriangleCirclepath,
                color: .pink
            )
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(.white.opacity(0.05))
        )
    }
    
    // MARK: - Presets Section
    private var presetsSection: some View {
        VStack(spacing: 12) {
            SectionHeader(
                title: L10n
                    .AntiStressView
                    .presetsSectionSectionHeaderTitle,
                icon: Icons.starFill
            )
            
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 12) {
                PresetButton(
                    title: L10n.AntiStressView.presetButtonTitleGentle
                    , icon: Icons.leafFill,
                    color: .green
                ) {
                    effectModel.applyPreset(.gentle)
                }
                
                PresetButton(
                    title: L10n.AntiStressView.presetButtonTitleDynamic,
                    icon: Icons.boltFill,
                    color: .yellow
                ) {
                    effectModel.applyPreset(.dynamic)
                }
                
                PresetButton(
                    title: L10n.AntiStressView.presetButtonTitleFluid,
                    icon: Icons.dropFill,
                    color: .blue
                ) {
                    effectModel.applyPreset(.fluid)
                }
                
                PresetButton(
                    title: L10n.AntiStressView.presetButtonTitleBouncy,
                    icon: Icons.basketballFill,
                    color: .orange
                ) {
                    effectModel.applyPreset(.bouncy)
                }
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(.white.opacity(0.05))
        )
    }
}

// MARK: - Preview
#Preview {
    AntiStressView()
}

