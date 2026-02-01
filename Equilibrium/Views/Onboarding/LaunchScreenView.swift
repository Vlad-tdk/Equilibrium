//
//  LaunchScreenView.swift
//  Equilibrium
//
//  Created by Vlad on 30. 1. 2026..
//

import SwiftUI

struct LaunchScreenView: View {
    @State private var logoScale: CGFloat = 0.5
    @State private var logoOpacity: Double = 0
    @State private var particlesOpacity: Double = 0
    @State private var textOpacity: Double = 0
    @State private var isAnimating = false
    
    var onComplete: () -> Void
    
    var body: some View {
        ZStack {
            // Background gradient
            backgroundGradient
            
            // Floating particles
            floatingParticles
            
            // Logo and text
            centerContent
        }
        .ignoresSafeArea()
        .onAppear {
            startAnimation()
        }
    }
    
    // MARK: - Background
    private var backgroundGradient: some View {
        LinearGradient(
            colors: [
                Color(hex: "0f0c29"),
                Color(hex: "302b63"),
                Color(hex: "24243e")
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
    // MARK: - Floating Particles
    private var floatingParticles: some View {
        ZStack {
            ForEach(0..<20, id: \.self) { index in
                Circle()
                    .fill(Color.white.opacity(0.1))
                    .frame(width: CGFloat.random(in: 4...12))
                    .position(
                        x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                        y: CGFloat.random(in: 0...UIScreen.main.bounds.height)
                    )
                    .opacity(particlesOpacity)
            }
        }
    }
    
    // MARK: - Center Content
    private var centerContent: some View {
        VStack(spacing: 24) {
            // Logo
            logoView
            
            // Text
            textView
        }
    }
    
    private var logoView: some View {
        ZStack {
            // Outer glow
            Circle()
                .fill(
                    RadialGradient(
                        colors: [
                            Color.cyan.opacity(0.4),
                            Color.cyan.opacity(0.2),
                            Color.clear
                        ],
                        center: .center,
                        startRadius: 30,
                        endRadius: 80
                    )
                )
                .frame(width: 160, height: 160)
                .blur(radius: 10)
            
            // Main circle
            Circle()
                .fill(
                    LinearGradient(
                        colors: [Color(hex: "6DD4FF"), Color(hex: "4A90E2")],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 120, height: 120)
                .shadow(color: .cyan.opacity(0.5), radius: 20, x: 0, y: 10)
            
            // Icon
            Image(systemName: Icons.circleHexagongridFill)
                .font(.system(size: 60))
                .foregroundColor(.white)
        }
        .scaleEffect(logoScale)
        .opacity(logoOpacity)
    }
    
    private var textView: some View {
        VStack(spacing: 8) {
            Text(L10n.Home.homeHeader)
                .font(.system(size: 36, weight: .bold, design: .rounded))
                .foregroundColor(.white)
            
            Text(L10n.Home.findInnerPeace)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white.opacity(0.8))
        }
        .opacity(textOpacity)
    }
    
    // MARK: - Animation
    private func startAnimation() {
        // Logo scale and fade in
        withAnimation(.spring(response: 0.8, dampingFraction: 0.6)) {
            logoScale = 1.0
            logoOpacity = 1.0
        }
        
        // Particles fade in
        withAnimation(.easeIn(duration: 0.8).delay(0.3)) {
            particlesOpacity = 1.0
        }
        
        // Text fade in
        withAnimation(.easeIn(duration: 0.6).delay(0.5)) {
            textOpacity = 1.0
        }
        
        // Complete
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            onComplete()
        }
    }
}

// MARK: - Preview
#Preview {
    LaunchScreenView(onComplete: {})
}
