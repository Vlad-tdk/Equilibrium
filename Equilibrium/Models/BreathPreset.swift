//
//  BreathPreset.swift
//  Equilibrium
//

import Foundation

struct BreathPreset: Identifiable {
    let id: String
    let name: String
    let description: String
    let inhale: Double
    let hold: Double
    let exhale: Double
    let cycles: Int
    let icon: String

    static let all: [BreathPreset] = [
        BreathPreset(
            id: "natural",
            name: "Natural Calm",
            description: "Gentle everyday breathing",
            inhale: 4, hold: 2, exhale: 6, cycles: 10,
            icon: "leaf.fill"
        ),
        BreathPreset(
            id: "box",
            name: "Box Breathing",
            description: "Equal intervals — focus & calm",
            inhale: 4, hold: 4, exhale: 4, cycles: 8,
            icon: "square"
        ),
        BreathPreset(
            id: "478",
            name: "4-7-8",
            description: "Deep relaxation & sleep",
            inhale: 4, hold: 7, exhale: 8, cycles: 4,
            icon: "moon.fill"
        ),
        BreathPreset(
            id: "wimhof",
            name: "Wim Hof",
            description: "Energy & clarity",
            inhale: 2, hold: 0, exhale: 2, cycles: 30,
            icon: "flame.fill"
        ),
    ]
}
