//
//  Particle.swift
//  Equilibrium
//
//  Created by Vlad on 30. 1. 2026..
//

import SwiftUI

// Модель частицы
struct Particle: Equatable {
    var x: CGFloat
    var y: CGFloat
    let startX: CGFloat
    let startY: CGFloat
    var vx: CGFloat = 0
    var vy: CGFloat = 0
    var color: Color
}
