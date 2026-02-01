//
//  BreathSettings.swift
//  Equilibrium
//
//  Created by Vlad on 30. 1. 2026..
//

import Foundation

// MARK: - Breath Settings Model
struct BreathSettings: Codable {
    let backgroundColor: ColorModel
    let circleColor: ColorModel
    let circleDiameter: CGFloat
    let inhaleTime: Double
    let holdTime: Double
    let exhaleTime: Double
    let totalCycles: Int
}
