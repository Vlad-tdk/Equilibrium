//
//  StatisticsView.swift
//  Equilibrium
//
//  Beautiful statistics screen with precise data
//

import SwiftUI

struct StatisticsView: View {
    @StateObject private var statsManager = StatisticsManager.shared
    @Environment(\.dismiss) private var dismiss
    @State private var selectedPeriod: StatsPeriod = .allTime
    
    var body: some View {
        ZStack {
            // Background
            backgroundGradient
            
            // Content
            VStack(spacing: 0) {
                header
                    .frame(height: 50)
                
                ScrollView {
                    VStack(spacing: 20) {
                        // Overview cards
                        overviewSection
                        
                        // Streak card
                        streakCard
                        
                        // Features breakdown
                        featuresSection
                        
                        // Detailed stats
                        detailedSection
                        
                        // Reset button (debug)
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
        LinearGradient(
            colors: Colors.AnimatedGradientBackgroundColor.colors,
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }
    
    // MARK: - Header
    private var header: some View {
        VStack() {
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
                
                // Placeholder for symmetry
                Color.clear
                    .frame(width: 44)
            }
            .padding(.horizontal)
        }
        .background(Color.clear)
    }
    
    // MARK: - Overview Section
    private var overviewSection: some View {
        VStack(spacing: 16) {
            HStack(spacing: 12) {
                overviewCard(
                    value: String(statsManager.getTotalSessions()),
                    label: String(localized: L10n.StatisticsView.labelSessions),
                    icon: Icons.checkmarkCircleFill,
                    color: .green
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
    
    private func overviewCard(value: String, label: String, icon: String, color: Color) -> some View {
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
                .fill(.white.opacity(0.1))
        )
    }
    
    private func formatTime(_ minutes: Int) -> String {
        if minutes >= 60 {
            let hours = minutes / 60
            let mins = minutes % 60
            return mins > 0 ? "\(hours)h \(mins)m" : "\(hours)h"
        }
        return "\(minutes)m"
    }
    
    // MARK: - Streak Card
    private var streakCard: some View {
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
                .fill(.white.opacity(0.1))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.orange.opacity(0.3), lineWidth: 1)
                )
        )
    }
    
    private var streakMessage: String {
        let streak = statsManager.stats.currentStreak
        if streak >= 30 {
            return String(localized:L10n.StatisticsView.streakAmazing)
        } else if streak >= 14 {
            return String(localized:L10n.StatisticsView.streakKeepGoing)
        } else if streak >= 7 {
            return String(localized: L10n.StatisticsView.streakOneWeek)
        } else if streak >= 3 {
            return String(localized: L10n.StatisticsView.streakBuildingMomtntum)
        }
        return String(localized: L10n.StatisticsView.streakYoureAwesome)
    }
    
    // MARK: - Features Section
    private var featuresSection: some View {
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
                        color: .cyan
                    )
                }
                
                if statsManager.stats.biometricSessions > 0 {
                    featureRow(
                        icon: Icons.waveformPathEcg,
                        title: "Biometric Coach",
                        sessions: statsManager.stats.biometricSessions,
                        time: statsManager.stats.totalBiometricMinutes,
                        detail: "Avg HR: \(statsManager.stats.avgHeartRate) • Coherence: \(statsManager.stats.avgCoherence)%",
                        color: .red
                    )
                }
                
                if statsManager.stats.mandalaSessions > 0 {
                    featureRow(
                        icon: Icons.circleHexagongrid,
                        title: String(localized:L10n.StatisticsView.mandalaTitleSessions),
                        sessions: statsManager.stats.mandalaSessions,
                        time: statsManager.stats.totalMandalaMinutes,
                        detail: L10n.StatisticsView.mandalaDetaledViewed(statsManager.stats.totalMandalasViewed),
                        color: .purple
                    )
                }
                
                if statsManager.stats.imagesSessions > 0 {
                    featureRow(
                        icon: Icons.photoOnRectangleAngled,
                        title: String(localized: L10n.StatisticsView.calmingTitle),
                        sessions: statsManager.stats.imagesSessions,
                        time: statsManager.stats.totalImagesMinutes,
                        detail:L10n.StatisticsView.calmingDetaledViewed(statsManager.stats.totalImagesViewed),
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
                        color: .green
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
        color: Color
    ) -> some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 24))
                .foregroundColor(color)
                .frame(width: 40)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
                
                HStack(spacing: 12) {
                    Label("\(sessions)", systemImage: "number")
                        .font(.system(size: 12))
                        .foregroundColor(.white.opacity(0.7))
                    
                    Label(formatTime(time), systemImage: "clock")
                        .font(.system(size: 12))
                        .foregroundColor(.white.opacity(0.7))
                }
                
                if let detail = detail {
                    Text(detail)
                        .font(.system(size: 12))
                        .foregroundColor(color.opacity(0.8))
                }
            }
            
            Spacer()
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(.white.opacity(0.08))
        )
    }
    
    // MARK: - Detailed Section
    private var detailedSection: some View {
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
                let stats = String(max(statsManager.stats.totalSessions / 2, 1))
                milestoneRow(
                    icon: Icons.calendar,
                    title: String(localized: L10n.StatisticsView.milestoneDaysActive),
                    value: stats,
                    color: .green
                )
                
                if statsManager.stats.totalBreathCycles > 0 {
                    milestoneRow(
                        icon: Icons.breath,
                        title: String(localized:L10n.StatisticsView.milestoneBreathCicles),
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
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(.white.opacity(0.9))
            
            Spacer()
            
            Text(value)
                .font(.system(size: 18, weight: .bold, design: .monospaced))
                .foregroundColor(.white)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(.white.opacity(0.08))
        )
    }
    
    private func formatDetailedTime(_ minutes: Int) -> String {
        let hours = minutes / 60
        let mins = minutes % 60
        
        if hours > 0 {
            return "\(hours)h \(mins)m"
        }
        return "\(mins)m"
    }
    
    // MARK: - Reset Button
    private var resetButton: some View {
        Button(action: {
            statsManager.resetStats()
        }) {
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
