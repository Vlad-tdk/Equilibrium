//
//  StatisticsView.swift
//  Equilibrium
//
//  Created by Vlad on 30. 1. 2026..
//

import SwiftUI

struct StatisticsView: View {
    @StateObject private var statsManager = StatisticsManager.shared
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            backgroundGradient

            VStack(spacing: 0) {
                header
                    .frame(height: 50)

                ScrollView {
                    VStack(spacing: 20) {
                        StatsDailyGoalCard(statsManager: statsManager)
                        StatsOverviewSection(statsManager: statsManager)
                        StatsActivityChart(statsManager: statsManager)
                        StatsStreakCard(statsManager: statsManager)
                        StatsFeaturesSection(statsManager: statsManager)
                        StatsMilestonesSection(statsManager: statsManager)

                        if ProcessInfo.processInfo.environment["DEBUG"] != nil {
                            resetButton
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationBarHidden(true)
    }

    // MARK: - Background
    private var backgroundGradient: some View {
        Colors.Background.statistics
            .ignoresSafeArea()
    }

    // MARK: - Header
    private var header: some View {
        HStack {
            Button(action: { dismiss() }) {
                Image(systemName: Icons.leftArrow)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)
            }

            Spacer()

            Text(L10n.StatisticsView.textTitle)
                .font(.system(size: 24, weight: .bold, design: .rounded))
                .foregroundColor(.white)

            Spacer()

            Color.clear
                .frame(width: 44)
        }
        .padding(.horizontal)
    }

    // MARK: - Reset Button (debug only)
    private var resetButton: some View {
        Button(action: { statsManager.resetStats() }) {
            Text(L10n.StatisticsView.resetStats)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.red)
                .frame(maxWidth: .infinity)
                .frame(height: 44)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.white.opacity(0.1))
                )
        }
        .padding(.top)
    }
}

// MARK: - Preview
#Preview {
    StatisticsView()
}
