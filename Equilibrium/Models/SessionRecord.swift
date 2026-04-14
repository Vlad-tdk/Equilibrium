//
//  SessionRecord.swift
//  Equilibrium
//

import Foundation

struct SessionRecord: Codable, Identifiable {
    var id: UUID = UUID()
    var date: Date
    var featureType: String   // "breath", "mandala", "images", "fire", "antiStress"
    var durationSeconds: Int

    var durationMinutes: Int { durationSeconds / 60 }

    static func relativeLabel(for date: Date) -> String {
        let cal = Calendar.current
        if cal.isDateInToday(date)     { return "Today" }
        if cal.isDateInYesterday(date) { return "Yesterday" }
        let days = cal.dateComponents([.day], from: date, to: Date()).day ?? 0
        return "\(days)d ago"
    }
}
