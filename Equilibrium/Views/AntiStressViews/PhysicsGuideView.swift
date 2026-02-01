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
                            title: "Force Strength",
                            icon: "bolt.fill",
                            color: .yellow,
                            description: "Controls how strongly particles react to touch.",
                            examples: [
                                "Low (5-15): Gentle, subtle movements",
                                "Medium (15-30): Balanced, natural feel",
                                "High (30-50): Strong, dramatic reactions"
                            ]
                        )
                        
                        guideSection(
                            title: "Interaction Radius",
                            icon: "circle.dotted",
                            color: .orange,
                            description: "The distance at which particles start reacting.",
                            examples: [
                                "Small (20-60): Precise, localized effect",
                                "Medium (60-120): Balanced spread",
                                "Large (120-200): Wide, flowing movements"
                            ]
                        )
                        
                        guideSection(
                            title: "Velocity Factor",
                            icon: "speedometer",
                            color: .blue,
                            description: "How quickly particles move.",
                            examples: [
                                "Slow (0.1-0.8): Dreamy, floating",
                                "Normal (0.8-1.5): Natural speed",
                                "Fast (1.5-3.0): Quick, energetic"
                            ]
                        )
                        
                        guideSection(
                            title: "Friction",
                            icon: "wind",
                            color: .indigo,
                            description: "How quickly particles slow down.",
                            examples: [
                                "Low (0.5-0.7): Slides far, fluid",
                                "Medium (0.7-0.85): Balanced damping",
                                "High (0.85-0.95): Stops quickly, stable"
                            ]
                        )
                        
                        guideSection(
                            title: "Spring Strength",
                            icon: "arrow.triangle.2.circlepath",
                            color: .pink,
                            description: "How strongly particles return to origin.",
                            examples: [
                                "Weak (0.01-0.05): Slow return, drifts",
                                "Medium (0.05-0.08): Balanced restoration",
                                "Strong (0.08-0.15): Quick snap back"
                            ]
                        )
                    }
                    .padding()
                }
            }
            .navigationTitle("Physics Guide")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                    .foregroundColor(.cyan)
                }
            }
        }
    }
    
    private func guideSection(
        title: String,
        icon: String,
        color: Color,
        description: String,
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
