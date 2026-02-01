//
//  ParticleEffectModel.swift
//  Equilibrium
//
//  Created by Vlad on 30. 1. 2026..
//

import SwiftUI
import Combine

// MARK: - Physics Preset
enum PhysicsPreset {
    case gentle
    case dynamic
    case fluid
    case bouncy
}

// MARK: - Particle Effect Model
class ParticleEffectModel: ObservableObject {
    // Visual parameters
    @Published var particles: [Particle] = []
    @Published var interactionPoint: CGPoint = .zero
    @Published var particleSize: CGFloat = 3.37
    @Published var particleSpacing: CGFloat = 8
    
    // Force parameters
    @Published var interactionRadius: CGFloat = 80
    @Published var forceStrength: CGFloat = 25
    @Published var forceSmoothness: CGFloat = 0.2
    
    // Physics parameters
    @Published var particleVelocityFactor: CGFloat = 1.2
    @Published var friction: CGFloat = 0.8
    @Published var springStrength: CGFloat = 0.05
    
    private var cancellables: Set<AnyCancellable> = []
    private let updateSubject = PassthroughSubject<Void, Never>()
    
    init() {
        startUpdateLoop()
    }
    
    private func startUpdateLoop() {
        Timer.publish(every: 1/60, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.updateSubject.send()
            }
            .store(in: &cancellables)
        
        updateSubject
            .collect(.byTime(DispatchQueue.main, .milliseconds(16)))
            .sink { [weak self] _ in
                self?.moveParticles()
            }
            .store(in: &cancellables)
    }
    
    func setupParticles(for size: CGSize) {
        let rowCount = Int(size.height / particleSpacing)
        let colCount = Int(size.width / particleSpacing)
        particles = (0..<rowCount).flatMap { row in
            (0..<colCount).map { column in
                let x = CGFloat(column) * particleSpacing
                let y = CGFloat(row) * particleSpacing
                
                // Rainbow gradient based on position
                let hue = Double(column) / Double(colCount)
                let initialColor = Color(hue: hue, saturation: 0.6, brightness: 0.8)
                
                return Particle(
                    x: x,
                    y: y,
                    startX: x,
                    startY: y,
                    color: initialColor
                )
            }
        }
    }
    
    private func moveParticles() {
        let interactionRadiusSquared = interactionRadius * interactionRadius
        
        particles = particles.map { particle in
            var modifiedParticle = particle
            
            // Calculate distance to interaction point
            let dx = interactionPoint.x - modifiedParticle.x
            let dy = interactionPoint.y - modifiedParticle.y
            let distanceSquared = dx * dx + dy * dy
            
            // Apply force if within radius
            if distanceSquared < interactionRadiusSquared && distanceSquared > 0 {
                let distance = sqrt(distanceSquared)
                
                // Smooth force falloff
                let normalizedDistance = distance / interactionRadius
                let force = max((1.0 - normalizedDistance) * forceSmoothness, forceSmoothness)
                
                // Calculate repulsion direction
                let angle = atan2(dy, dx)
                let forceX = -cos(angle) * force * forceStrength
                let forceY = -sin(angle) * force * forceStrength
                
                // Apply force to velocity
                modifiedParticle.vx += forceX * particleVelocityFactor
                modifiedParticle.vy += forceY * particleVelocityFactor
            }
            
            // Apply friction (damping)
            modifiedParticle.vx *= friction
            modifiedParticle.vy *= friction
            
            // Update position
            modifiedParticle.x += modifiedParticle.vx
            modifiedParticle.y += modifiedParticle.vy
            
            // Spring force back to origin
            let offsetX = modifiedParticle.startX - modifiedParticle.x
            let offsetY = modifiedParticle.startY - modifiedParticle.y
            
            modifiedParticle.x += offsetX * springStrength
            modifiedParticle.y += offsetY * springStrength
            
            // Color based on speed and distance
            let speed = sqrt(modifiedParticle.vx * modifiedParticle.vx + modifiedParticle.vy * modifiedParticle.vy)
            let displacement = sqrt(offsetX * offsetX + offsetY * offsetY)
            
            if speed > 0.1 || displacement > 5 {
                // Fast moving or displaced - vibrant colors
                let hue = min(speed / 10, 1.0)
                let saturation = min(displacement / 50, 1.0)
                modifiedParticle.color = Color(
                    hue: hue,
                    saturation: 0.6 + saturation * 0.4,
                    brightness: 0.8 + speed * 0.2
                )
            } else {
                // At rest - return to base color
                let baseHue = modifiedParticle.startX / UIScreen.main.bounds.width
                modifiedParticle.color = Color(
                    hue: baseHue,
                    saturation: 0.6,
                    brightness: 0.8
                )
            }
            
            return modifiedParticle
        }
    }
    
    // MARK: - Presets
    func applyPreset(_ preset: PhysicsPreset) {
        switch preset {
        case .gentle:
            interactionRadius = 30
            forceStrength = 15
            forceSmoothness = 0.3
            particleVelocityFactor = 0.8
            friction = 0.85
            springStrength = 0.03
            
        case .dynamic:
            interactionRadius = 60
            forceStrength = 35
            forceSmoothness = 0.2
            particleVelocityFactor = 1.5
            friction = 0.75
            springStrength = 0.08
            
        case .fluid:
            interactionRadius = 80
            forceStrength = 20
            forceSmoothness = 0.5
            particleVelocityFactor = 1.0
            friction = 0.9
            springStrength = 0.02
            
        case .bouncy:
            interactionRadius = 100
            forceStrength = 40
            forceSmoothness = 0.15
            particleVelocityFactor = 2.0
            friction = 0.7
            springStrength = 0.12
        }
    }
    
    func resetToDefaults() {
        particleSize = 3.37
        particleSpacing = 8
        interactionRadius = 30
        forceStrength = 25
        forceSmoothness = 0.2
        particleVelocityFactor = 1.2
        friction = 0.8
        springStrength = 0.05
    }
}
