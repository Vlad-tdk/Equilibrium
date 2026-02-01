//
//  RatingManager.swift
//  Equilibrium
//
//  Created by Vlad on 6.9.23..
//

import SwiftUI
import StoreKit
import Combine

class RatingManager: ObservableObject {
    static let shared = RatingManager()
    
    @Published var showRatingPrompt = false
    
    // Keys for UserDefaults
    private let sessionsKey = "appSessionCount"
    private let lastPromptKey = "lastRatingPromptDate"
    private let hasRatedKey = "hasRatedApp"
    private let breathSessionsKey = "breathSessionsCompleted"
    private let meditationTimeKey = "totalMeditationMinutes"
    
    // Trigger thresholds (not intrusive)
    private let minSessionsBeforePrompt = 5      // After 5 sessions
    private let minDaysBetweenPrompts = 90       // 3 months between prompts
    private let minBreathSessions = 3            // After completing 3 breath sessions
    
    private init() {}
    
    // MARK: - Session Tracking
    func incrementSessionCount() {
        let count = UserDefaults.standard.integer(forKey: sessionsKey)
        UserDefaults.standard.set(count + 1, forKey: sessionsKey)
    }
    
    func recordBreathSessionCompleted() {
        let count = UserDefaults.standard.integer(forKey: breathSessionsKey)
        UserDefaults.standard.set(count + 1, forKey: breathSessionsKey)
        
        // Check if we should show prompt
        checkAndShowRatingPrompt()
    }
    
    func recordMeditationTime(minutes: Int) {
        let total = UserDefaults.standard.integer(forKey: meditationTimeKey)
        UserDefaults.standard.set(total + minutes, forKey: meditationTimeKey)
    }
    
    // MARK: - Rating Request Logic
    private func shouldShowRatingPrompt() -> Bool {
        // Never show if already rated
        if UserDefaults.standard.bool(forKey: hasRatedKey) {
            return false
        }
        
        // Check minimum sessions
        let sessions = UserDefaults.standard.integer(forKey: sessionsKey)
        guard sessions >= minSessionsBeforePrompt else { return false }
        
        // Check breath sessions (meaningful engagement)
        let breathSessions = UserDefaults.standard.integer(forKey: breathSessionsKey)
        guard breathSessions >= minBreathSessions else { return false }
        
        // Check time since last prompt
        if let lastPrompt = UserDefaults.standard.object(forKey: lastPromptKey) as? Date {
            let daysSince = Calendar.current.dateComponents([.day], from: lastPrompt, to: Date()).day ?? 0
            guard daysSince >= minDaysBetweenPrompts else { return false }
        }
        
        return true
    }
    
    func checkAndShowRatingPrompt() {
        guard shouldShowRatingPrompt() else { return }
        
        // Show our custom prompt (more gentle than native)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.showRatingPrompt = true
            UserDefaults.standard.set(Date(), forKey: self.lastPromptKey)
        }
    }
    
    // MARK: - User Actions
    func userRated() {
        UserDefaults.standard.set(true, forKey: hasRatedKey)
        showRatingPrompt = false
        
        // Request native rating
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            SKStoreReviewController.requestReview(in: scene)
        }
    }
    
    func userDismissed() {
        showRatingPrompt = false
        // Will ask again after 90 days if they continue using
    }
    
    func userWantsToShareFeedback() {
        UserDefaults.standard.set(true, forKey: hasRatedKey) // Don't ask again
        showRatingPrompt = false
        // Open feedback form or email
    }
    
    // MARK: - Stats for Display
    func getUserStats() -> (sessions: Int, breathSessions: Int, minutes: Int) {
        let sessions = UserDefaults.standard.integer(forKey: sessionsKey)
        let breathSessions = UserDefaults.standard.integer(forKey: breathSessionsKey)
        let minutes = UserDefaults.standard.integer(forKey: meditationTimeKey)
        return (sessions, breathSessions, minutes)
    }
}

// MARK: - Preview
#Preview {
    ZStack {
        Color.black
        RatingPromptView()
    }
}
