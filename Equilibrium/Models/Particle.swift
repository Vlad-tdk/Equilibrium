//
//  Particle.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 26.10.24..
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
