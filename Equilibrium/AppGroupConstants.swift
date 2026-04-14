//
//  AppGroupConstants.swift
//  Equilibrium
//
// Shared between the main app and EquilibriumWidget extension.
// ⚠️  After adding the Widget target, enable the App Group capability in
//     Signing & Capabilities for BOTH targets using the same identifier below.
//

import Foundation

enum AppGroup {
    static let suiteName = "group.none.Equilibrium"

    // Keys written by StatisticsManager, read by the widget
    enum WidgetKeys {
        static let currentStreak   = "widget_current_streak"
        static let longestStreak   = "widget_longest_streak"
        static let totalSessions   = "widget_total_sessions"
        static let totalMinutes    = "widget_total_minutes"
        static let lastSessionDate = "widget_last_session_date"
    }

    static var shared: UserDefaults {
        UserDefaults(suiteName: suiteName) ?? .standard
    }
}
