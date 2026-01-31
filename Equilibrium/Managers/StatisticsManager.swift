//
//  StatisticsManager.swift
//  Equilibrium
//
//  Precise statistics tracking system
//

import SwiftUI
import Combine

class StatisticsManager: ObservableObject {
    static let shared = StatisticsManager()
    
    // MARK: - Published Stats
    @Published var stats = AppStatistics()
    
    private let defaults = UserDefaults.standard
    
    // Keys
    private let statsKey = "appStatistics"
    
    private init() {
        loadStats()
    }
    
    // MARK: - Track Sessions
    func trackAppSession() {
        stats.totalSessions += 1
        stats.lastSessionDate = Date()
        saveStats()
    }
    
    func trackBreathSession(duration: TimeInterval, cycles: Int) {
        stats.breathSessions += 1
        stats.totalBreathingMinutes += Int(duration / 60)
        stats.totalBreathingSeconds += Int(duration.truncatingRemainder(dividingBy: 60))
        stats.totalBreathCycles += cycles
        stats.lastBreathDate = Date()
        
        // Update streak
        updateStreak()
        saveStats()
    }
    
    func trackMandalaSession(duration: TimeInterval, mandalasViewed: Int) {
        stats.mandalaSessions += 1
        stats.totalMandalaMinutes += Int(duration / 60)
        stats.totalMandalasViewed += mandalasViewed
        stats.lastMandalaDate = Date()
        saveStats()
    }
    
    func trackImagesSession(duration: TimeInterval, imagesViewed: Int) {
        stats.imagesSessions += 1
        stats.totalImagesMinutes += Int(duration / 60)
        stats.totalImagesViewed += imagesViewed
        stats.lastImagesDate = Date()
        saveStats()
    }
    
    func trackFireSession(duration: TimeInterval) {
        stats.fireSessions += 1
        stats.totalFireMinutes += Int(duration / 60)
        stats.lastFireDate = Date()
        saveStats()
    }
    
    func trackAntiStressSession(duration: TimeInterval, interactions: Int) {
        stats.antiStressSessions += 1
        stats.totalAntiStressMinutes += Int(duration / 60)
        stats.totalInteractions += interactions
        stats.lastAntiStressDate = Date()
        saveStats()
    }
    
    func trackBiometricSession(duration: TimeInterval, avgHeartRate: Int, avgCoherence: Int) {
        stats.biometricSessions += 1
        stats.totalBiometricMinutes += Int(duration / 60)
        
        // Update averages
        let totalSessions = Double(stats.biometricSessions)
        stats.avgHeartRate = Int((Double(stats.avgHeartRate) * (totalSessions - 1) + Double(avgHeartRate)) / totalSessions)
        stats.avgCoherence = Int((Double(stats.avgCoherence) * (totalSessions - 1) + Double(avgCoherence)) / totalSessions)
        
        stats.lastBiometricDate = Date()
        saveStats()
    }
    
    // MARK: - Streak Management
    private func updateStreak() {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        
        if let lastDate = stats.lastStreakDate {
            let lastDay = calendar.startOfDay(for: lastDate)
            let daysBetween = calendar.dateComponents([.day], from: lastDay, to: today).day ?? 0
            
            if daysBetween == 0 {
                // Same day - no change
                return
            } else if daysBetween == 1 {
                // Consecutive day - increment
                stats.currentStreak += 1
                stats.longestStreak = max(stats.longestStreak, stats.currentStreak)
            } else {
                // Missed days - reset
                stats.currentStreak = 1
            }
        } else {
            // First time
            stats.currentStreak = 1
            stats.longestStreak = 1
        }
        
        stats.lastStreakDate = today
    }
    
    // MARK: - Computed Stats
    func getTotalMinutes() -> Int {
        return stats.totalBreathingMinutes +
               stats.totalMandalaMinutes +
               stats.totalImagesMinutes +
               stats.totalFireMinutes +
               stats.totalAntiStressMinutes +
               stats.totalBiometricMinutes
    }
    
    func getTotalHours() -> Int {
        return getTotalMinutes() / 60
    }
    
    func getTotalSessions() -> Int {
        return stats.breathSessions +
               stats.mandalaSessions +
               stats.imagesSessions +
               stats.fireSessions +
               stats.antiStressSessions +
               stats.biometricSessions
    }
    
    func getMostUsedFeature() -> String {
        let features = [
            ("Breathing", stats.breathSessions),
            ("Mandala", stats.mandalaSessions),
            ("Images", stats.imagesSessions),
            ("Fire", stats.fireSessions),
            ("Anti-Stress", stats.antiStressSessions),
            ("Biometric", stats.biometricSessions)
        ]
        
        return features.max(by: { $0.1 < $1.1 })?.0 ?? "None"
    }
    
    func getAverageDailyMinutes() -> Int {
        guard stats.totalSessions > 0 else { return 0 }
        let days = max(stats.totalSessions / 2, 1) // Approximate
        return getTotalMinutes() / days
    }
    
    // MARK: - Persistence
    private func saveStats() {
        if let encoded = try? JSONEncoder().encode(stats) {
            defaults.set(encoded, forKey: statsKey)
        }
    }
    
    private func loadStats() {
        guard let data = defaults.data(forKey: statsKey),
              let decoded = try? JSONDecoder().decode(AppStatistics.self, from: data) else {
            return
        }
        stats = decoded
    }
    
    // MARK: - Reset (for testing)
    func resetStats() {
        stats = AppStatistics()
        saveStats()
    }
}

// MARK: - App Statistics Model
struct AppStatistics: Codable {
    // General
    var totalSessions: Int = 0
    var lastSessionDate: Date?
    
    // Breathing
    var breathSessions: Int = 0
    var totalBreathingMinutes: Int = 0
    var totalBreathingSeconds: Int = 0
    var totalBreathCycles: Int = 0
    var lastBreathDate: Date?
    
    // Mandala
    var mandalaSessions: Int = 0
    var totalMandalaMinutes: Int = 0
    var totalMandalasViewed: Int = 0
    var lastMandalaDate: Date?
    
    // Images
    var imagesSessions: Int = 0
    var totalImagesMinutes: Int = 0
    var totalImagesViewed: Int = 0
    var lastImagesDate: Date?
    
    // Fire
    var fireSessions: Int = 0
    var totalFireMinutes: Int = 0
    var lastFireDate: Date?
    
    // Anti-Stress
    var antiStressSessions: Int = 0
    var totalAntiStressMinutes: Int = 0
    var totalInteractions: Int = 0
    var lastAntiStressDate: Date?
    
    // Biometric
    var biometricSessions: Int = 0
    var totalBiometricMinutes: Int = 0
    var avgHeartRate: Int = 0
    var avgCoherence: Int = 0
    var lastBiometricDate: Date?
    
    // Streaks
    var currentStreak: Int = 0
    var longestStreak: Int = 0
    var lastStreakDate: Date?
}
