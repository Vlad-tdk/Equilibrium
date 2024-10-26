//
//  ParticleCanvas.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 26.10.24..
//

import SwiftUI

struct ParticleCanvas: View {
    let particles: [Particle]
    let size: CGFloat
    
    var body: some View {
        Canvas { context, canvasSize in
            for particle in particles {
                context.fill(
                    Path(ellipseIn: CGRect(
                        x: particle.x - size / 2,
                        y: particle.y - size / 2,
                        width: size,
                        height: size
                    )),
                    with: .color(particle.color)
                )
            }
        }
    }
}
