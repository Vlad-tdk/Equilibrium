//
//  Colors.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 30. 1. 2026..
//

import Foundation
import SwiftUI

enum Colors {
    enum GradientColors {
        static var breath = [Color(hex: "6DD4FF"), Color(hex: "4A90E2")]
        static var mandala = [Color(hex: "A18CD1"), Color(hex: "FBC2EB")]
        static var images = [Color(hex: "89F7FE"), Color(hex: "66A6FF")]
        static var fire = [Color(hex: "FF6B6B"), Color(hex: "FFE66D")]
        static var antiStress = [Color(hex: "6EE7B7"), Color(hex: "3B82F6")]
        static var about = [Color(hex: "9CA3AF"), Color(hex: "6B7280")]
        static var iconGradientColor = [Color(hex: "6DD4FF"), Color(hex: "4A90E2")]
    }
    
    enum AnimatedGradientBackgroundColor{
        static var colors = [
            Color(hex: "3E7352"),
            Color(hex: "6B94CB"),
            Color(hex: "4A7C9E")
        ]
    }
    
    static var appIconColor = Color(hex: "4A90E2").opacity(0.4)
    static var gradientBreathButton = LinearGradient(
        colors: [Color(hex: "6DD4FF"), Color(hex: "4A90E2")],
        startPoint: .leading,
        endPoint: .trailing
    )
    static var shadowBreathButtonColor = Color(hex: "4A90E2").opacity(0.4)
    
    enum OnboardingGradientColors {
        static var firstScreen: [Color] = [Color(hex: "6DD4FF"), Color(hex: "4A90E2")]
        static var secondScreen: [Color] = [Color(hex: "A18CD1"), Color(hex: "FBC2EB")]
        static var thirdScreen: [Color] = [Color(hex: "6EE7B7"), Color(hex: "3B82F6")]
        static var fourthScreen: [Color] = [Color(hex: "9CA3AF"), Color(hex: "6B7280")]
    }
    enum RatingPromptViewColors {
        static var backgroundColor = LinearGradient(
            colors: [Color(hex: "1a1a2e"), Color(hex: "16213e")],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        static var buttonBackgroundColor = LinearGradient(
            colors: [Color(hex: "6DD4FF"), Color(hex: "4A90E2")],
            startPoint: .leading,
            endPoint: .trailing
        )
        static var circleGradientColor = LinearGradient(
            colors: [Color(hex: "6DD4FF"), Color(hex: "4A90E2")],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}
