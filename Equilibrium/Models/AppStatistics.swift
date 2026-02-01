//
//  AppStatistics.swift
//  Equilibrium
//
//  Created by Vlad on 6.9.23..
//

import Foundation

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
