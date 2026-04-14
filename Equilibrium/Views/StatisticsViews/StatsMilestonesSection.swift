//
//  StatsMilestonesSection.swift
//  Equilibrium
//

import SwiftUI

struct StatsMilestonesSection: View {
    @ObservedObject var statsManager: StatisticsManager

    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text(L10n.StatisticsView.milestoneTitle)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                Spacer()
            }

            VStack(spacing: 12) {
                milestoneRow(
                    icon: Icons.starFill,
                    title: String(localized: L10n.StatisticsView.milestoneTotalSessions),
                    value: "\(statsManager.getTotalSessions())",
                    color: .yellow
                )

                milestoneRow(
                    icon: Icons.clockFill,
                    title: String(localized: L10n.StatisticsView.milestoneTimeInvected),
                    value: formatDetailedTime(statsManager.getTotalMinutes()),
                    color: .cyan
                )

                milestoneRow(
                    icon: Icons.calendar,
                    title: String(localized: L10n.StatisticsView.milestoneDaysActive),
                    value: String(max(statsManager.stats.totalSessions / 2, 1)),
                    color: .green
                )

                if statsManager.stats.totalBreathCycles > 0 {
                    milestoneRow(
                        icon: Icons.breath,
                        title: String(localized: L10n.StatisticsView.milestoneBreathCycles),
                        value: "\(statsManager.stats.totalBreathCycles)",
                        color: .blue
                    )
                }
            }
        }
    }

    private func milestoneRow(icon: String, title: String, value: String, color: Color) -> some View {
        HStack {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(color)
                .frame(width: 32)

            Text(title)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white.opacity(0.9))

            Spacer()

            Text(value)
                .font(.system(size: 18, weight: .bold, design: .monospaced))
                .foregroundColor(.white)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Colors.Stats.cardBackground)
        )
    }
}

private func formatDetailedTime(_ minutes: Int) -> String {
    let hours = minutes / 60
    let mins = minutes % 60
    if hours > 0 {
        return "\(hours)h \(mins)m"
    }
    return "\(mins)m"
}
