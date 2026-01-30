//
//  BreathViewModel.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 30. 1. 2026..
//

import SwiftUI
import Combine

// MARK: - Breath View Model
class BreathViewModel: ObservableObject {
    @Published var scale: CGFloat = 1.0
    @Published var isAnimating = false
    @Published var breathPhase = "Inhale"
    @Published var showSettings = false
    
    // Customizable colors
    @Published var backgroundColor = Color(hex: "1a1a2e")
    @Published var circleColor = Color.white
    
    private var breathTimer: Timer?
    private var currentCycle = 0
    private let totalCycles = 15
    
    init() {
        loadColors()
    }
    
    func startBreathing() {
        isAnimating = true
        currentCycle = 0
        performBreathCycle()
    }
    
    func stopBreathing() {
        isAnimating = false
        breathTimer?.invalidate()
        withAnimation(.easeOut(duration: 0.5)) {
            scale = 1.0
        }
    }
    
    private func performBreathCycle() {
        guard currentCycle < totalCycles else {
            stopBreathing()
            return
        }
        
        // Inhale phase
        breathPhase = "Inhale"
        withAnimation(.easeInOut(duration: 4.0)) {
            scale = 2.0
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) { [weak self] in
            guard let self = self, self.isAnimating else { return }
            
            // Hold phase
            self.breathPhase = "Hold"
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
                guard let self = self, self.isAnimating else { return }
                
                // Exhale phase
                self.breathPhase = "Exhale"
                withAnimation(.easeInOut(duration: 4.0)) {
                    self.scale = 1.0
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) { [weak self] in
                    guard let self = self, self.isAnimating else { return }
                    
                    // Hold phase
                    self.breathPhase = "Hold"
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
                        guard let self = self else { return }
                        self.currentCycle += 1
                        self.performBreathCycle()
                    }
                }
            }
        }
    }
    
    func saveColors() {
        let bgColor = ColorModel(from: backgroundColor)
        let circleCol = ColorModel(from: circleColor)
        
        if let bgData = try? JSONEncoder().encode(bgColor),
           let circleData = try? JSONEncoder().encode(circleCol) {
            UserDefaults.standard.set(bgData, forKey: "breathBackgroundColor")
            UserDefaults.standard.set(circleData, forKey: "breathCircleColor")
        }
    }
    
    private func loadColors() {
        if let bgData = UserDefaults.standard.data(forKey: "breathBackgroundColor"),
           let bgColorModel = try? JSONDecoder().decode(ColorModel.self, from: bgData) {
            backgroundColor = bgColorModel.toColor()
        }
        
        if let circleData = UserDefaults.standard.data(forKey: "breathCircleColor"),
           let circleColorModel = try? JSONDecoder().decode(ColorModel.self, from: circleData) {
            circleColor = circleColorModel.toColor()
        }
    }
}
