//
//  PhysicsGuideView.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 1. 2. 2026..
//

import SwiftUI

// MARK: - Physics Guide View
struct PhysicsGuideView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    colors: [Color(hex: "0f0c29"), Color(hex: "302b63")],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        guideSection(
                            title: L10n.PhysicsGuideView.titleForceStrength,
                            icon: Icons.boltFill,
                            color: .yellow,
                            description: L10n.PhysicsGuideView.descriptionControlsHowStronglyParticlesReactToTouch,
                            examples: [
                                String(localized: L10n.PhysicsGuideView.exampleLowGentleSubtleMovements),
                                String(localized: L10n.PhysicsGuideView.exampleMediumBalancedNaturaFeel),
                                String(localized: L10n.PhysicsGuideView.exampleHighStrongDramaticReactions)
                            ]
                        )
                        
                        guideSection(
                            title: L10n.PhysicsGuideView.titleInteractionRadius,
                            icon: Icons.circleDotted,
                            color: .orange,
                            description: L10n.PhysicsGuideView.descriptionTheDistanceAtWhichParticleStartReacting,
                            examples: [
                                String(localized: L10n.PhysicsGuideView.exampleSmallPreciselocalizedeffect),
                                String(localized: L10n.PhysicsGuideView.exampleMediumBalancedSpread),
                                String(localized: L10n.PhysicsGuideView.exampleLargeWideFlowingMovements)
                            ]
                        )
                        
                        guideSection(
                            title: L10n.PhysicsGuideView.titleVelocityFactor,
                            icon: Icons.speedometer,
                            color: .blue,
                            description: L10n.PhysicsGuideView.descriptionHowQuicklyParticlesMove,
                            examples: [
                                String(localized: L10n.PhysicsGuideView.exampleSlowDreamyFloating),
                                String(localized: L10n.PhysicsGuideView.exampleNormalNaturalSpeed),
                                String(localized: L10n.PhysicsGuideView.exampleFastQuickEnergetic)
                            ]
                        )
                        
                        guideSection(
                            title: L10n.PhysicsGuideView.titleFriction,
                            icon: Icons.breath,
                            color: .indigo,
                            description: L10n.PhysicsGuideView.descriptionHowQuicklyParticlesSlowDown,
                            examples: [
                                String(localized: L10n.PhysicsGuideView.exampleLowSlidesFarFluid),
                                String(localized: L10n.PhysicsGuideView.exampleMediumBalancedDamping),
                                String(localized: L10n.PhysicsGuideView.exampleHighStopsQuicklyStable)
                            ]
                        )
                        
                        guideSection(
                            title: L10n.PhysicsGuideView.titleSpringStrength,
                            icon: Icons.arrowTriangleCirclepath,
                            color: .pink,
                            description: L10n.PhysicsGuideView.descriptionHowStronglyParticlesReturnToOrigin,
                            examples: [
                                String(localized: L10n.PhysicsGuideView.exampleWeakSlowReturnDrifts),
                                String(localized: L10n.PhysicsGuideView.exampleMediumBalancedRestoration),
                                String(localized: L10n.PhysicsGuideView.exampleStrongQuickSnapBack)
                            ]
                        )
                    }
                    .padding()
                }
            }
            .navigationTitle(L10n.PhysicsGuideView.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(L10n.Common.done) {
                        dismiss()
                    }
                    .foregroundColor(.cyan)
                }
            }
        }
    }
    
    private func guideSection(
        title: LocalizedStringResource,
        icon: String,
        color: Color,
        description: LocalizedStringResource,
        examples: [String]
    ) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: icon)
                    .font(.system(size: 20))
                    .foregroundColor(color)
                
                Text(title)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
            }
            
            Text(description)
                .font(.system(size: 15))
                .foregroundColor(.white.opacity(0.8))
            
            VStack(alignment: .leading, spacing: 8) {
                ForEach(examples, id: \.self) { example in
                    HStack(alignment: .top, spacing: 8) {
                        Text("•")
                            .foregroundColor(color)
                        Text(example)
                            .font(.system(size: 14))
                            .foregroundColor(.white.opacity(0.7))
                    }
                }
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(.white.opacity(0.1))
        )
    }
}
