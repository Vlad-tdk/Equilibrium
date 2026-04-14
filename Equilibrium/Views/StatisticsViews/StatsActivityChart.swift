//
//  StatsActivityChart.swift
//  Equilibrium
//

import SwiftUI
import Charts

struct StatsActivityChart: View {
    @ObservedObject var statsManager: StatisticsManager

    private var chartData: [DayActivity] {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())

        return (0..<7).reversed().map { offset -> DayActivity in
            let date = calendar.date(byAdding: .day, value: -offset, to: today)!
            let minutes = statsManager.stats.recentSessions
                .filter { calendar.isDate($0.date, inSameDayAs: date) }
                .reduce(0) { $0 + $1.durationMinutes }
            return DayActivity(date: date, minutes: minutes)
        }
    }

    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text("Last 7 Days")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                Spacer()
                Text("min / day")
                    .font(.system(size: 13))
                    .foregroundColor(.white.opacity(0.45))
            }

            if chartData.allSatisfy({ $0.minutes == 0 }) {
                emptyState
            } else {
                chart
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Colors.Stats.cardBackground)
        )
    }

    private var chart: some View {
        Chart(chartData) { day in
            BarMark(
                x: .value("Day", day.label),
                y: .value("Minutes", day.minutes)
            )
            .foregroundStyle(Colors.accentGradientVertical)
            .cornerRadius(6)
        }
        .chartXAxis {
            AxisMarks { _ in
                AxisValueLabel()
                    .foregroundStyle(Color.white.opacity(0.6))
            }
        }
        .chartYAxis {
            AxisMarks { _ in
                AxisGridLine(stroke: StrokeStyle(lineWidth: 0.5))
                    .foregroundStyle(Color.white.opacity(0.15))
                AxisValueLabel()
                    .foregroundStyle(Color.white.opacity(0.6))
            }
        }
        .frame(height: 140)
    }

    private var emptyState: some View {
        HStack {
            Spacer()
            VStack(spacing: 6) {
                Image(systemName: "chart.bar")
                    .font(.system(size: 28))
                    .foregroundColor(.white.opacity(0.25))
                Text("Start meditating to see your activity")
                    .font(.system(size: 13))
                    .foregroundColor(.white.opacity(0.4))
            }
            Spacer()
        }
        .frame(height: 100)
    }
}

// MARK: - Data Model

private struct DayActivity: Identifiable {
    let id = UUID()
    let date: Date
    let minutes: Int

    var label: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        return formatter.string(from: date)
    }
}
