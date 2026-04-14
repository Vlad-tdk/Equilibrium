//
//  Colors.swift
//  Equilibrium
//
//  Created by Vlad on 30. 1. 2026..
//

import Foundation
import SwiftUI

enum Colors {

    // MARK: - Palette (raw named colors)

    enum Palette {
        static let cyan      = Color(hex: "6DD4FF")  // primary accent
        static let blue      = Color(hex: "4A90E2")  // secondary accent
        static let darkBg    = Color(hex: "1a1a2e")  // sheet / card dark base
        static let darkBgMid = Color(hex: "16213e")
        static let darkBgDeep = Color(hex: "0f3460")
        static let cosmos1   = Color(hex: "0f0c29")
        static let cosmos2   = Color(hex: "302b63")
        static let cosmos3   = Color(hex: "24243e")
    }

    // MARK: - Accent gradients (shared across buttons, icons, charts)

    /// Horizontal — default button gradient
    static var accentGradient = LinearGradient(
        colors: [Palette.cyan, Palette.blue],
        startPoint: .leading,
        endPoint: .trailing
    )

    /// Diagonal — logos, circle fills, card highlights
    static var accentGradientDiagonal = LinearGradient(
        colors: [Palette.cyan, Palette.blue],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    /// Vertical — chart bars
    static var accentGradientVertical = LinearGradient(
        colors: [Palette.cyan, Palette.blue],
        startPoint: .top,
        endPoint: .bottom
    )

    // MARK: - Background gradients

    enum Background {
        /// Deep cosmic — LaunchScreen, AntiStress, PhysicsGuide
        static let cosmos = LinearGradient(
            colors: [Palette.cosmos1, Palette.cosmos2, Palette.cosmos3],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )

        /// Night blue — NotificationSettings, CustomTracksSheet, deep modal sheets
        static let night = LinearGradient(
            colors: [Palette.darkBg, Palette.darkBgMid, Palette.darkBgDeep],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )

        /// Statistics screen background
        static let statistics = LinearGradient(
            colors: [Color(hex: "4A7C9E"), Color(hex: "3E7352"), Color(hex: "#6bc8cb")],
            startPoint: .topTrailing,
            endPoint: .bottomLeading
        )

        /// Top-bar fade overlay (AntiStress topBar)
        static let topBarFade = LinearGradient(
            colors: [Color.black.opacity(0.5), Color.clear],
            startPoint: .top,
            endPoint: .bottom
        )
    }

    // MARK: - Feature gradient color arrays (MeditationCard icons)

    enum GradientColors {
        static var breath        = [Palette.cyan, Palette.blue]
        static var mandala       = [Color(hex: "A18CD1"), Color(hex: "FBC2EB")]
        static var images        = [Color(hex: "89F7FE"), Color(hex: "66A6FF")]
        static var fire          = [Color(hex: "FF6B6B"), Color(hex: "FFE66D")]
        static var antiStress    = [Color(hex: "6EE7B7"), Color(hex: "3B82F6")]
        static var about         = [Color(hex: "9CA3AF"), Color(hex: "6B7280")]
        static var iconGradientColor = [Palette.cyan, Palette.blue]
    }

    // MARK: - Animated gradient background (Home screen)

    enum AnimatedGradientBackgroundColor {
        static var colors = [
            Color(hex: "3E7352"),
            Color(hex: "6B94CB"),
            Color(hex: "4A7C9E")
        ]
    }

    // MARK: - Misc

    static var appIconColor         = Palette.blue.opacity(0.4)
    static var gradientBreathButton = accentGradient          // alias kept for compatibility
    static var shadowBreathButtonColor = Palette.blue.opacity(0.4)

    // MARK: - Statistics cards

    enum Stats {
        static var cardBackground = LinearGradient(
            colors: [
                Color(hex: "#e0f2fe").opacity(0.3),
                Color(hex: "#dbeafe").opacity(0.3),
                Color(hex: "#bfdbfe").opacity(0.3)
            ],
            startPoint: .top,
            endPoint: .bottom
        )
    }

    // MARK: - Onboarding

    enum OnboardingGradientColors {
        static var firstScreen:  [Color] = [Palette.cyan, Palette.blue]
        static var secondScreen: [Color] = [Color(hex: "A18CD1"), Color(hex: "FBC2EB")]
        static var thirdScreen:  [Color] = [Color(hex: "6EE7B7"), Color(hex: "3B82F6")]
        static var fourthScreen: [Color] = [Color(hex: "9CA3AF"), Color(hex: "6B7280")]
    }

    // MARK: - Rating prompt

    enum RatingPromptViewColors {
        static var backgroundColor = LinearGradient(
            colors: [Palette.darkBg, Palette.darkBgMid],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        static var buttonBackgroundColor = accentGradient
        static var circleGradientColor   = accentGradientDiagonal
    }
}
