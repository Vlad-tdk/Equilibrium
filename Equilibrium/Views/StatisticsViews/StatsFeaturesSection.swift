//
//  StatsFeaturesSection.swift
//  Equilibrium
//

import SwiftUI

struct StatsFeaturesSection: View {
    @ObservedObject var statsManager: StatisticsManager

    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text(L10n.StatisticsView.featuresTitle)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                Spacer()
            }

            VStack(spacing: 12) {
                if statsManager.stats.breathSessions > 0 {
                    featureRow(
                        icon: Icons.breath,
                        title: String(localized: L10n.StatisticsView.breathingTitle),
                        sessions: statsManager.stats.breathSessions,
                        time: statsManager.stats.totalBreathingMinutes,
                        detail: L10n.StatisticsView.statsTotalBreathCycles(statsManager.stats.totalBreathCycles),
                        lastDate: statsManager.stats.lastBreathDate,
                        color: .cyan
                    )
                }

                if statsManager.stats.mandalaSessions > 0 || statsManager.stats.totalMandalasViewed > 0 {
                    featureRow(
                        icon: Icons.circleHexagongrid,
                        title: String(localized: L10n.StatisticsView.mandalaTitleSessions),
                        sessions: statsManager.stats.mandalaSessions,
                        time: statsManager.stats.totalMandalaMinutes,
                        detail: L10n.StatisticsView.mandalaDetaledViewed(statsManager.stats.totalMandalasViewed),
                        lastDate: statsManager.stats.lastMandalaDate,
                        color: .purple
                    )
                }

                if statsManager.stats.imagesSessions > 0 {
                    featureRow(
                        icon: Icons.photoOnRectangleAngled,
                        title: String(localized: L10n.StatisticsView.calmingTitle),
                        sessions: statsManager.stats.imagesSessions,
                        time: statsManager.stats.totalImagesMinutes,
                        detail: L10n.StatisticsView.calmingDetaledViewed(statsManager.stats.totalImagesViewed),
                        lastDate: statsManager.stats.lastImagesDate,
                        color: .blue
                    )
                }

                if statsManager.stats.fireSessions > 0 {
                    featureRow(
                        icon: Icons.flameFill,
                        title: String(localized: L10n.StatisticsView.fireTitle),
                        sessions: statsManager.stats.fireSessions,
                        time: statsManager.stats.totalFireMinutes,
                        detail: nil,
                        lastDate: statsManager.stats.lastFireDate,
                        color: .orange
                    )
                }

                if statsManager.stats.antiStressSessions > 0 {
                    featureRow(
                        icon: Icons.antiStress,
                        title: String(localized: L10n.StatisticsView.antiStressTitle),
                        sessions: statsManager.stats.antiStressSessions,
                        time: statsManager.stats.totalAntiStressMinutes,
                        detail: L10n.StatisticsView.antiStressDetaled(statsManager.stats.totalInteractions),
                        lastDate: statsManager.stats.lastAntiStressDate,
                        color: Color(hex: "#11a303")
                    )
                }
            }
        }
    }

    private func featureRow(
        icon: String,
        title: String,
        sessions: Int,
        time: Int,
        detail: String?,
        lastDate: Date?,
        color: Color
    ) -> some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 24))
                .foregroundColor(color)
                .frame(width: 40)

            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(title)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                    Spacer()
                    if let lastDate {
                        Text(SessionRecord.relativeLabel(for: lastDate))
                            .font(.system(size: 12))
                            .foregroundColor(.white.opacity(0.45))
                    }
                }

                HStack(spacing: 12) {
                    Label(String(sessions), systemImage: Icons.number)
                        .font(.system(size: 14))
                        .foregroundColor(.white.opacity(0.7))

                    Label(formatTime(time), systemImage: Icons.clock)
                        .font(.system(size: 14))
                        .foregroundColor(.white.opacity(0.7))
                }

                if let detail = detail {
                    Text(detail)
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(color.opacity(0.9))
                }
            }

            Spacer(minLength: 0)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 12)
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
