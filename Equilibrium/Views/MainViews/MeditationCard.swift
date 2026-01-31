//
//  MeditationCard.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 30. 1. 2026..
//

import SwiftUI

// MARK: - Meditation Card
struct MeditationCard: View {
    let type: MeditationType
    @State private var isPressed = false
    
    var body: some View {
        NavigationLink(destination: destinationView) {
            HStack(spacing: 16) {
                // Icon
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: type.gradientColors,
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 60, height: 60)
                        .shadow(color: type.gradientColors.first!.opacity(0.4),
                                radius: 8, x: 0, y: 4)
                    
                    Image(systemName: type.icon)
                        .font(.system(size: 28, weight: .semibold))
                        .foregroundColor(.white)
                }
                
                // Text
                VStack(alignment: .leading, spacing: 4) {
                    Text(type.title)
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text(type.subtitle)
                        .font(.system(size: 14))
                        .foregroundColor(.white.opacity(0.7))
                }
                
                Spacer()
                
                // Arrow
                Image(systemName: Icons.rightArrow)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white.opacity(0.5))
            }
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white.opacity(0.1))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.white.opacity(0.2), lineWidth: 1)
                    )
                    .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
            )
        }
        .buttonStyle(PressableCardStyle())
    }
    
    @ViewBuilder
    private var destinationView: some View {
        switch type {
        case .breath:
            BreathView()
        case .mandala:
            MandalaView()
        case .images:
            CalmingImagesView()
        case .fire:
            FireMeditationView()
        case .antiStress:
            AntiStressView()
        case .about:
            AboutView()
        }
    }
}

// MARK: - Pressable Card Style
struct PressableCardStyle: ButtonStyle {
    var pressedScale: CGFloat = 0.97
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? pressedScale : 1.0)
            .animation(.easeOut(duration: 0.12), value: configuration.isPressed)
    }
}
