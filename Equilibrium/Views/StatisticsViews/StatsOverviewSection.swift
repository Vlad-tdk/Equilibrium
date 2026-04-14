//
//  StatsOverviewSection.swift
//  Equilibrium
//

import SwiftUI

struct StatsOverviewSection: View {
    @ObservedObject var statsManager: StatisticsManager

    var body: some View {
        VStack(spacing: 16) {
            HStack(spacing: 12) {
                overviewCard(
                    value: String(statsManager.getTotalSessions()),
                    label: String(localized: L10n.StatisticsView.labelSessions),
                    icon: Icons.checkmarkCircleFill,
                    color: Color(hex: "#0a3b06")
                )

                overviewCard(
                    value: formatTime(statsManager.getTotalMinutes()),
                    label: String(localized: L10n.StatisticsView.labelTotalTime),
                    icon: Icons.clockFill,
                    color: .cyan
                )
            }

            HStack(spacing: 12) {
                overviewCard(
                    value: String(statsManager.stats.currentStreak),
                    label: String(localized: L10n.StatisticsView.labelDayStreak),
                    icon: Icons.flameFill,
                    color: .orange
                )

                overviewCard(
                    value: statsManager.getMostUsedFeature(),
                    label: String(localized: L10n.StatisticsView.labelFavorite),
                    icon: Icons.starFill,
                    color: .yellow
                )
            }
        }
    }

    private func overviewCard(
        value: String,
        label: String,
        icon: String,
        color: Color
    ) -> some View {
        VStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 28))
                .foregroundColor(color)

            Text(value)
                .font(.system(size: 24, weight: .bold, design: .monospaced))
                .foregroundColor(.white)

            Text(label)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.white.opacity(0.7))
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Colors.Stats.cardBackground)
        )
    }
}

private func formatTime(_ minutes: Int) -> String {
    if minutes >= 60 {
        let hours = minutes / 60
        let mins = minutes % 60
        return mins > 0 ? "\(hours)h \(mins)m" : "\(hours)h"
    }
    return "\(minutes)m"
}
