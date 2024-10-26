//
//  ParticleEffectModel.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 26.10.24..
//

import SwiftUI
import Combine

// Модель частицы с другими свойствами и настройками для обновления
class ParticleEffectModel: ObservableObject {
    @Published var particles: [Particle]
    @Published var interactionPoint: CGPoint = .zero
    @Published var particleSize: CGFloat = 3.37
    @Published var particleSpacing: CGFloat = 8
    @Published var interactionRadius: CGFloat = 30
    @Published var particleVelocityFactor: CGFloat = 1.2
    
    private var cancellables: Set<AnyCancellable> = []
    private let updateSubject = PassthroughSubject<Void, Never>()
    
    init() {
        particles = []
        startUpdateLoop()
    }
    
    private func startUpdateLoop() {
        Timer.publish(every: 1/100, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.updateSubject.send()
            }
            .store(in: &cancellables)
        
        updateSubject
            .collect(.byTime(DispatchQueue.main, .milliseconds(20)))
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
                return Particle(x: x, y: y, startX: x, startY: y, color: .green)
            }
        }
    }
    
    private func moveParticles() {
        let interactionRadiusSquared = interactionRadius * interactionRadius
        particles = particles.map { particle in
            var modifiedParticle = particle
            let dx = interactionPoint.x - modifiedParticle.x
            let dy = interactionPoint.y - modifiedParticle.y
            let distanceSquared = dx * dx + dy * dy
            
            if distanceSquared < interactionRadiusSquared {
                let distance = sqrt(distanceSquared)
                let force = max((interactionRadius - distance) / interactionRadius, 0.2)
                let angle = atan2(dy, dx)
                let moveX = modifiedParticle.x - cos(angle) * force * 25
                let moveY = modifiedParticle.y - sin(angle) * force * 25
                
                modifiedParticle.vx += (moveX - modifiedParticle.x) * particleVelocityFactor
                modifiedParticle.vy += (moveY - modifiedParticle.y) * particleVelocityFactor
            }
            
            modifiedParticle.vx *= 0.8
            modifiedParticle.vy *= 0.8
            
            modifiedParticle.x += modifiedParticle.vx
            modifiedParticle.y += modifiedParticle.vy
            
            let offsetX = modifiedParticle.startX - modifiedParticle.x
            let offsetY = modifiedParticle.startY - modifiedParticle.y
            let resetDistanceSquared = offsetX * offsetX + offsetY * offsetY
            
            if resetDistanceSquared > 1 {
                modifiedParticle.x += offsetX * 0.05
                modifiedParticle.y += offsetY * 0.05
            }
            
            let speed = sqrt(modifiedParticle.vx * modifiedParticle.vx + modifiedParticle.vy * modifiedParticle.vy)
            if speed > 0.02 {
                modifiedParticle.color = Color(hue: min(speed / 15, 1.0), saturation: 1.0, brightness: 1.0)
            } else {
                modifiedParticle.color = .indigo
            }
            
            return modifiedParticle
        }
    }
}
