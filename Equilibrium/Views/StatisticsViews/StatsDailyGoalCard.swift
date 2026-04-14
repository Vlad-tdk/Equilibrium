//
//  StatsDailyGoalCard.swift
//  Equilibrium
//

import SwiftUI

struct StatsDailyGoalCard: View {
    @ObservedObject var statsManager: StatisticsManager
    @State private var showGoalPicker = false

    private var todayMinutes: Int { statsManager.stats.todayMinutes }
    private var goalMinutes: Int  { statsManager.stats.dailyGoalMinutes }
    private var progress: Double  { min(Double(todayMinutes) / Double(max(goalMinutes, 1)), 1.0) }
    private var isComplete: Bool  { todayMinutes >= goalMinutes }

    var body: some View {
        HStack(spacing: 20) {
            // Progress ring
            ZStack {
                Circle()
                    .stroke(Color.white.opacity(0.15), lineWidth: 6)
                    .frame(width: 64, height: 64)
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(
                        isComplete ? Color.green : Color.cyan,
                        style: StrokeStyle(lineWidth: 6, lineCap: .round)
                    )
                    .rotationEffect(.degrees(-90))
                    .frame(width: 64, height: 64)
                    .animation(.easeInOut(duration: 0.5), value: progress)

                if isComplete {
                    Image(systemName: "checkmark")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.green)
                } else {
                    VStack(spacing: 0) {
                        Text("\(todayMinutes)")
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                        Text("min")
                            .font(.system(size: 10))
                            .foregroundColor(.white.opacity(0.6))
                    }
                }
            }

            // Labels
            VStack(alignment: .leading, spacing: 4) {
                Text(isComplete ? "Goal reached! 🎉" : "Today's goal")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
                Text(isComplete
                     ? "You meditated \(todayMinutes) min today"
                     : "\(todayMinutes) of \(goalMinutes) min")
                    .font(.system(size: 13))
                    .foregroundColor(.white.opacity(0.65))
            }

            Spacer()

            // Edit goal
            Button {
                showGoalPicker = true
            } label: {
                Image(systemName: "pencil")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white.opacity(0.6))
                    .padding(8)
                    .background(Circle().fill(.white.opacity(0.1)))
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Colors.Stats.cardBackground)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(isComplete ? Color.green.opacity(0.4) : Color.cyan.opacity(0.3), lineWidth: 1)
                )
        )
        .sheet(isPresented: $showGoalPicker) {
            GoalPickerSheet(currentGoal: goalMinutes) { newGoal in
                statsManager.setDailyGoal(newGoal)
            }
        }
    }
}

// MARK: - Goal Picker Sheet

private struct GoalPickerSheet: View {
    let currentGoal: Int
    let onSave: (Int) -> Void
    @Environment(\.dismiss) private var dismiss
    @State private var selected: Int

    private let options = [5, 10, 15, 20, 30, 45, 60]

    init(currentGoal: Int, onSave: @escaping (Int) -> Void) {
        self.currentGoal = currentGoal
        self.onSave = onSave
        _selected = State(initialValue: currentGoal)
    }

    var body: some View {
        NavigationView {
            ZStack {
                Colors.Palette.darkBg.ignoresSafeArea()

                VStack(spacing: 16) {
                    Text("Daily meditation goal")
                        .font(.system(size: 15))
                        .foregroundColor(.white.opacity(0.6))
                        .padding(.top, 8)

                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                        ForEach(options, id: \.self) { min in
                            Button {
                                selected = min
                            } label: {
                                VStack(spacing: 4) {
                                    Text("\(min)")
                                        .font(.system(size: 28, weight: .bold, design: .rounded))
                                    Text("min")
                                        .font(.system(size: 13))
                                }
                                .foregroundColor(selected == min ? .white : .white.opacity(0.6))
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 16)
                                .background(
                                    RoundedRectangle(cornerRadius: 14)
                                        .fill(selected == min
                                              ? AnyShapeStyle(Colors.accentGradientDiagonal)
                                              : AnyShapeStyle(Color.white.opacity(0.08)))
                                )
                            }
                        }
                    }
                    .padding(.horizontal)

                    Spacer()
                }
            }
            .navigationTitle("Set Goal")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") { dismiss() }.foregroundColor(.white)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        onSave(selected)
                        dismiss()
                    }
                    .fontWeight(.semibold)
                    .foregroundColor(Colors.Palette.cyan)
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}
