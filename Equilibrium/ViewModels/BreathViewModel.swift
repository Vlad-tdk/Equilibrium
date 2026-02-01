//
//  BreathViewModel.swift
//  Equilibrium
//
//  Created by Vlad on 30. 1. 2026..
//

import Foundation
import Combine
import SwiftUI
import CoreGraphics

// MARK: - Breath View Model
class BreathViewModel: ObservableObject {
    @Published var scale: CGFloat = 1.0
    @Published var isAnimating = false
    @Published var breathPhase = "Ready"
    @Published var showSettings = false
    @Published var phaseTimeRemaining: Int = 0
    
    // Customizable settings
    @Published var backgroundColor = Color(hex: "1a1a2e")
    @Published var circleColor = Color.white
    @Published var circleDiameter: CGFloat = 200
    @Published var inhaleTime: Double = 4.0
    @Published var holdTime: Double = 2.0
    @Published var exhaleTime: Double = 6.0
    @Published var totalCycles: Int = 10
    
    var currentCycle = 0
    private var phaseTimer: Timer?
    
    init() {
        loadSettings()
    }
    
    func startBreathing() {
        isAnimating = true
        currentCycle = 0
        performBreathCycle()
    }
    
    func stopBreathing() {
        isAnimating = false
        phaseTimer?.invalidate()
        phaseTimer = nil
        withAnimation(.easeOut(duration: 0.5)) {
            scale = 1.0
        }
        breathPhase = "Ready"
        
        // Track completed session for rating
        if currentCycle >= totalCycles {
            RatingManager.shared.recordBreathSessionCompleted()
            let minutes = Int((inhaleTime + holdTime * 2 + exhaleTime) * Double(totalCycles) / 60)
            let duration = (inhaleTime + holdTime * 2 + exhaleTime) * Double(totalCycles)
            RatingManager.shared.recordMeditationTime(minutes: minutes)
            StatisticsManager.shared.trackBreathSession(
                duration: duration,
                cycles: totalCycles
            )
            print()
        }
    }
    
    private func performBreathCycle() {
        guard isAnimating, currentCycle < totalCycles else {
            stopBreathing()
            return
        }
        
        // Inhale phase
        breathPhase = String(localized: L10n.BreathView.inhale)
        animateWithCountdown(
            duration: inhaleTime,
            scale: 2.0,
            nextPhase: performHoldAfterInhale
        )
    }
    
    private func performHoldAfterInhale() {
        guard isAnimating else { return }
        
        breathPhase = String(localized: L10n.BreathView.hold)
        countdownOnly(
            duration: holdTime,
            nextPhase: performExhale
        )
    }
    
    private func performExhale() {
        guard isAnimating else { return }
        
        breathPhase = String(localized: L10n.BreathView.exhale)
        animateWithCountdown(
            duration: exhaleTime,
            scale: 1.0,
            nextPhase: performHoldAfterExhale
        )
    }
    
    private func performHoldAfterExhale() {
        guard isAnimating else { return }
        
        breathPhase = String(localized: L10n.BreathView.hold)
        currentCycle += 1
        
        countdownOnly(
            duration: holdTime,
            nextPhase: performBreathCycle
        )
    }
    
    private func animateWithCountdown(duration: Double, scale targetScale: CGFloat, nextPhase: @escaping () -> Void) {
        phaseTimeRemaining = Int(duration)
        
        withAnimation(.easeInOut(duration: duration)) {
            scale = targetScale
        }
        
        startCountdown(duration: duration, nextPhase: nextPhase)
    }
    
    private func countdownOnly(duration: Double, nextPhase: @escaping () -> Void) {
        phaseTimeRemaining = Int(duration)
        startCountdown(duration: duration, nextPhase: nextPhase)
    }
    
    private func startCountdown(duration: Double, nextPhase: @escaping () -> Void) {
        phaseTimer?.invalidate()
        
        var remaining = duration
        phaseTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
            guard let self = self else {
                timer.invalidate()
                return
            }
            
            remaining -= 1
            self.phaseTimeRemaining = Int(max(0, remaining))
            
            if remaining <= 0 {
                timer.invalidate()
                nextPhase()
            }
        }
    }
    
    func saveSettings() {
        let settings = BreathSettings(
            backgroundColor: ColorModel(from: backgroundColor),
            circleColor: ColorModel(from: circleColor),
            circleDiameter: circleDiameter,
            inhaleTime: inhaleTime,
            holdTime: holdTime,
            exhaleTime: exhaleTime,
            totalCycles: totalCycles
        )
        
        if let data = try? JSONEncoder().encode(settings) {
            UserDefaults.standard.set(data, forKey: "breathSettings")
        }
    }
    
    private func loadSettings() {
        guard let data = UserDefaults.standard.data(forKey: "breathSettings"),
              let settings = try? JSONDecoder().decode(BreathSettings.self, from: data) else {
            return
        }
        
        backgroundColor = settings.backgroundColor.toColor()
        circleColor = settings.circleColor.toColor()
        circleDiameter = settings.circleDiameter
        inhaleTime = settings.inhaleTime
        holdTime = settings.holdTime
        exhaleTime = settings.exhaleTime
        totalCycles = settings.totalCycles
    }
    
    func resetToDefaults() {
        backgroundColor = Color(hex: "1a1a2e")
        circleColor = .white
        circleDiameter = 200
        inhaleTime = 4.0
        holdTime = 2.0
        exhaleTime = 6.0
        totalCycles = 10
    }
}
