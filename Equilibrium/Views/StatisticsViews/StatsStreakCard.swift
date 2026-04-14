//
//  StatsStreakCard.swift
//  Equilibrium
//

import SwiftUI

struct StatsStreakCard: View {
    @ObservedObject var statsManager: StatisticsManager

    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Image(systemName: Icons.flameFill)
                    .font(.system(size: 24))
                    .foregroundColor(.orange)

                Text(L10n.StatisticsView.streakTitle)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)

                Spacer()
            }

            HStack(spacing: 30) {
                VStack(spacing: 8) {
                    Text(String(statsManager.stats.currentStreak))
                        .font(.system(size: 36, weight: .bold, design: .rounded))
                        .foregroundColor(.orange)

                    Text(L10n.StatisticsView.currentTitle)
                        .font(.system(size: 14))
                        .foregroundColor(.white.opacity(0.7))
                }

                Divider()
                    .background(Color.white.opacity(0.2))
                    .frame(height: 50)

                VStack(spacing: 8) {
                    Text(String(statsManager.stats.longestStreak))
                        .font(.system(size: 36, weight: .bold, design: .rounded))
                        .foregroundColor(.yellow)

                    Text(L10n.StatisticsView.longestTitle)
                        .lineLimit(2)
                        .font(.system(size: 14))
                        .foregroundColor(.white.opacity(0.7))
                }
            }
            .frame(maxWidth: .infinity)

            if statsManager.stats.currentStreak > 0 {
                Text(streakMessage)
                    .font(.system(size: 14))
                    .foregroundColor(.white.opacity(0.8))
                    .multilineTextAlignment(.center)
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Colors.Stats.cardBackground)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.blue.opacity(0.5), lineWidth: 1)
                )
        )
    }

    private var streakMessage: String {
        let streak = statsManager.stats.currentStreak
        if streak >= 30 {
            return String(localized: L10n.StatisticsView.streakAmazing)
        } else if streak >= 14 {
            return String(localized: L10n.StatisticsView.streakKeepGoing)
        } else if streak >= 7 {
            return String(localized: L10n.StatisticsView.streakOneWeek)
        } else if streak >= 3 {
            return String(localized: L10n.StatisticsView.streakBuildingMomentum)
        }
        return String(localized: L10n.StatisticsView.streakYoureAwesome)
    }
}
