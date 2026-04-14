//
//  WidgetDataStore.swift
//  EquilibriumWidget
//
// Reads the snapshot written by StatisticsManager.syncToWidget().
// Both targets share App Group: group.none.Equilibrium
//

import Foundation

// MARK: - Entry Model

struct WidgetEntry {
    let currentStreak: Int
    let longestStreak: Int
    let totalSessions: Int
    let totalMinutes: Int
    let lastSessionDate: Date?

    static var placeholder: WidgetEntry {
        WidgetEntry(
            currentStreak: 7,
            longestStreak: 14,
            totalSessions: 42,
            totalMinutes: 380,
            lastSessionDate: Date()
        )
    }

    var formattedTotalTime: String {
        let hours = totalMinutes / 60
        let mins  = totalMinutes % 60
        if hours > 0 { return "\(hours)h \(mins)m" }
        return "\(mins)m"
    }

    var streakLabel: String {
        currentStreak == 1 ? "1 day" : "\(currentStreak) days"
    }
}

// MARK: - Data Store

enum WidgetDataStore {
    private static let suiteName = "group.none.Equilibrium"

    private enum Keys {
        static let currentStreak   = "widget_current_streak"
        static let longestStreak   = "widget_longest_streak"
        static let totalSessions   = "widget_total_sessions"
        static let totalMinutes    = "widget_total_minutes"
        static let lastSessionDate = "widget_last_session_date"
    }

    static func load() -> WidgetEntry {
        let store = UserDefaults(suiteName: suiteName) ?? .standard
        return WidgetEntry(
            currentStreak:   store.integer(forKey: Keys.currentStreak),
            longestStreak:   store.integer(forKey: Keys.longestStreak),
            totalSessions:   store.integer(forKey: Keys.totalSessions),
            totalMinutes:    store.integer(forKey: Keys.totalMinutes),
            lastSessionDate: store.object(forKey: Keys.lastSessionDate) as? Date
        )
    }
}
