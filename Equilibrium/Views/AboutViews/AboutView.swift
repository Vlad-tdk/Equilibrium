//
//  AboutView.swift
//  Equilibrium
//
//  Created by Vlad on 30. 1. 2026..
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
                Image(systemName: Icons.leftArrow)
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
                            colors: Colors.GradientColors.iconGradientColor,
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 120, height: 120)
                    .shadow(color: Colors.appIconColor, radius: 20, x: 0, y: 10)
                
                Image(systemName: Icons.leafCircle)
                    .font(.system(size: 60))
                    .foregroundColor(.white)
            }
            
            Text(L10n.Home.homeHeader)
                .font(.system(size: 36, weight: .bold, design: .rounded))
                .foregroundColor(.white)
            
            Text(L10n.AboutView.versionNumber)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white.opacity(0.7))
        }
        .padding(.top, 20)
    }
    
    private var featuresSection: some View {
        VStack(spacing: 16) {
            Text(L10n.AboutView.features)
                .font(.system(size: 24, weight: .bold, design: .rounded))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ForEach(features) { feature in
                FeatureCard(feature: feature)
            }
        }
    }
    
    private var infoSection: some View {
        VStack(spacing: 20) {
            InfoCard(
                title: L10n.AboutView.about,
                text: L10n.AboutView.aboutText
            )
            
            InfoCard(
                title: L10n.AboutView.howToUse,
                text: L10n.AboutView.howToUseText
            )
        }
    }
    
    private let features = [
        Feature(
            icon: Icons.breath,
            title: L10n.ModeMeditation.Title.breath,
            description: L10n.ModeMeditation.Subtitle.breath
        ),
        Feature(
            icon: Icons.mandala,
            title: L10n.ModeMeditation.Title.mandala,
            description: L10n.ModeMeditation.Subtitle.mandala
        ),
        Feature(
            icon: Icons.images,
            title: L10n.ModeMeditation.Title.images,
            description: L10n.ModeMeditation.Subtitle.images
        ),
        Feature(
            icon: Icons.fire,
            title: L10n.ModeMeditation.Title.fire,
            description: L10n.ModeMeditation.Subtitle.fire
        ),
        Feature(
            icon: Icons.antiStress,
            title: L10n.ModeMeditation.Title.antiStress,
            description: L10n.ModeMeditation.Subtitle.antiStress
        )
    ]
}


// MARK: - Preview
#Preview {
    AboutView()
}
