//
//  EquilibriumWidget.swift
//  EquilibriumWidget
//

import WidgetKit
import SwiftUI

// MARK: - Timeline Entry

struct EquilibriumEntry: TimelineEntry {
    let date: Date
    let data: WidgetEntry
}

// MARK: - Timeline Provider

struct EquilibriumProvider: TimelineProvider {
    func placeholder(in context: Context) -> EquilibriumEntry {
        EquilibriumEntry(date: Date(), data: .placeholder)
    }

    func getSnapshot(in context: Context, completion: @escaping (EquilibriumEntry) -> Void) {
        completion(EquilibriumEntry(date: Date(), data: WidgetDataStore.load()))
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<EquilibriumEntry>) -> Void) {
        let entry = EquilibriumEntry(date: Date(), data: WidgetDataStore.load())
        // Refresh at midnight so streak date flips correctly
        let midnight = Calendar.current.startOfDay(for: Date().addingTimeInterval(86_400))
        completion(Timeline(entries: [entry], policy: .after(midnight)))
    }
}

// MARK: - Widget Views

struct EquilibriumWidgetView: View {
    let entry: EquilibriumEntry
    @Environment(\.widgetFamily) private var family

    var body: some View {
        switch family {
        case .accessoryCircular:    circularView
        case .accessoryRectangular: rectangularView
        default:                    smallView
        }
    }

    // ── Lock Screen · Circular ──────────────────────────────────────────────
    // Flame + streak number
    private var circularView: some View {
        ZStack {
            AccessoryWidgetBackground()
            VStack(spacing: 1) {
                Image(systemName: "flame.fill")
                    .font(.system(size: 13, weight: .bold))
                    .foregroundColor(.orange)
                Text("\(entry.data.currentStreak)")
                    .font(.system(size: 22, weight: .bold, design: .rounded))
                    .minimumScaleFactor(0.5)
            }
        }
        .widgetAccentable()
    }

    // ── Lock Screen · Rectangular ───────────────────────────────────────────
    // Streak | Total sessions
    private var rectangularView: some View {
        HStack(spacing: 20) {
            VStack(alignment: .leading, spacing: 3) {
                Label(entry.data.streakLabel, systemImage: "flame.fill")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.orange)
                    .widgetAccentable()
                Text("streak")
                    .font(.system(size: 11))
                    .foregroundColor(.secondary)
            }

            Divider().frame(height: 36)

            VStack(alignment: .leading, spacing: 3) {
                Text("\(entry.data.totalSessions)")
                    .font(.system(size: 20, weight: .bold, design: .monospaced))
                    .foregroundColor(.primary)
                Text("sessions")
                    .font(.system(size: 11))
                    .foregroundColor(.secondary)
            }

            Spacer()
        }
    }

    // ── Home Screen · Small ─────────────────────────────────────────────────
    // Full stats card with gradient background
    private var smallView: some View {
        ZStack(alignment: .topLeading) {
            // Background
            LinearGradient(
                colors: [
                    Color(red: 0.29, green: 0.49, blue: 0.62),
                    Color(red: 0.24, green: 0.45, blue: 0.32)
                ],
                startPoint: .topTrailing,
                endPoint: .bottomLeading
            )

            VStack(alignment: .leading, spacing: 0) {
                // App label
                Text("Equilibrium")
                    .font(.system(size: 11, weight: .semibold))
                    .foregroundColor(.white.opacity(0.55))

                Spacer()

                // Streak
                HStack(alignment: .lastTextBaseline, spacing: 4) {
                    Image(systemName: "flame.fill")
                        .font(.system(size: 18))
                        .foregroundColor(.orange)
                    Text("\(entry.data.currentStreak)")
                        .font(.system(size: 38, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                }
                Text("day streak")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.white.opacity(0.7))
                    .padding(.top, 1)

                Spacer()

                // Bottom row
                HStack {
                    Label("\(entry.data.totalSessions)", systemImage: "checkmark.circle.fill")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.white.opacity(0.8))
                    Spacer()
                    Text(entry.data.formattedTotalTime)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.white.opacity(0.8))
                }
            }
            .padding(14)
        }
        .widgetURL(URL(string: "equilibrium://open"))
    }
}

// MARK: - Widget Configuration

struct EquilibriumWidget: Widget {
    let kind = "EquilibriumWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: EquilibriumProvider()) { entry in
            EquilibriumWidgetView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .configurationDisplayName("Equilibrium")
        .description("Your meditation streak and sessions at a glance.")
        .supportedFamilies([.accessoryCircular, .accessoryRectangular, .systemSmall])
    }
}

// MARK: - Preview

#Preview("Small", as: .systemSmall) {
    EquilibriumWidget()
} timeline: {
    EquilibriumEntry(date: .now, data: .placeholder)
}

#Preview("Circular", as: .accessoryCircular) {
    EquilibriumWidget()
} timeline: {
    EquilibriumEntry(date: .now, data: .placeholder)
}

#Preview("Rectangular", as: .accessoryRectangular) {
    EquilibriumWidget()
} timeline: {
    EquilibriumEntry(date: .now, data: .placeholder)
}
