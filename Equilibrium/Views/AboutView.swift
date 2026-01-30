//
//  AboutView.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 30. 1. 2026..
//

import SwiftUI

struct AboutView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            // Animated gradient background
            AnimatedGradientBackground()
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 30) {
                    // Header
                    header
                    
                    // App icon
                    appIcon
                    
                    // Features
                    featuresSection
                    
                    // Info
                    infoSection
                    
                    Spacer(minLength: 50)
                }
                .padding()
            }
        }
        .navigationBarHidden(true)
    }
    
    private var header: some View {
        HStack {
            Button(action: { dismiss() }) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)
            }
            
            Spacer()
        }
        .padding(.top)
    }
    
    private var appIcon: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [Color(hex: "6DD4FF"), Color(hex: "4A90E2")],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 120, height: 120)
                    .shadow(color: Color(hex: "4A90E2").opacity(0.4), radius: 20, x: 0, y: 10)
                
                Image(systemName: "leaf.circle.fill")
                    .font(.system(size: 60))
                    .foregroundColor(.white)
            }
            
            Text("Equilibrium")
                .font(.system(size: 36, weight: .bold, design: .rounded))
                .foregroundColor(.white)
            
            Text("Version 2.0")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white.opacity(0.7))
        }
        .padding(.top, 20)
    }
    
    private var featuresSection: some View {
        VStack(spacing: 16) {
            Text("Features")
                .font(.system(size: 24, weight: .bold, design: .rounded))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ForEach(features, id: \.title) { feature in
                FeatureCard(feature: feature)
            }
        }
    }
    
    private var infoSection: some View {
        VStack(spacing: 20) {
            InfoCard(
                title: "About",
                text: """
                Equilibrium is a meditation and relaxation app designed to help you find inner peace through various techniques:
                
                • Breathing exercises for stress relief
                • Mandala meditation for focus
                • Calming nature images
                • Fire meditation for cleansing
                • Interactive anti-stress therapy
                
                Take a moment each day to connect with yourself and find your balance.
                """
            )
            
            InfoCard(
                title: "How to Use",
                text: """
                1. Choose a meditation type from the main menu
                2. Follow the on-screen instructions
                3. Find a quiet space
                4. Practice regularly for best results
                5. Adjust settings to your preference
                """
            )
        }
    }
    
    private let features = [
        Feature(
            icon: "wind",
            title: "Breathing Training",
            description: "Guided breathing exercises to calm your mind"
        ),
        Feature(
            icon: "circle.hexagongrid",
            title: "Mandala Meditation",
            description: "Focus through sacred geometry patterns"
        ),
        Feature(
            icon: "photo.on.rectangle.angled",
            title: "Calming Images",
            description: "Peaceful visuals for relaxation"
        ),
        Feature(
            icon: "flame.fill",
            title: "Fire Meditation",
            description: "Cleansing through flame contemplation"
        ),
        Feature(
            icon: "sparkles",
            title: "Anti-Stress",
            description: "Interactive particle therapy"
        )
    ]
}

// MARK: - Feature Card
struct FeatureCard: View {
    let feature: Feature
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: feature.icon)
                .font(.system(size: 24, weight: .semibold))
                .foregroundColor(.white)
                .frame(width: 50, height: 50)
                .background(
                    Circle()
                        .fill(.white.opacity(0.2))
                )
            
            VStack(alignment: .leading, spacing: 4) {
                Text(feature.title)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                
                Text(feature.description)
                    .font(.system(size: 14))
                    .foregroundColor(.white.opacity(0.7))
            }
            
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(.white.opacity(0.1))
        )
    }
}

// MARK: - Info Card
struct InfoCard: View {
    let title: String
    let text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .foregroundColor(.white)
            
            Text(text)
                .font(.system(size: 15))
                .foregroundColor(.white.opacity(0.8))
                .lineSpacing(6)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.white.opacity(0.1))
        )
    }
}

// MARK: - Feature Model
struct Feature {
    let icon: String
    let title: String
    let description: String
}

// MARK: - Preview
#Preview {
    AboutView()
}
