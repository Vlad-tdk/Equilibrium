//
//  NotificationSettingsView.swift
//  Equilibrium
//

import SwiftUI
import UserNotifications

struct NotificationSettingsView: View {
    @StateObject private var manager = NotificationManager.shared
    @Environment(\.dismiss) private var dismiss

    @State private var selectedHour: Int = 8
    @State private var selectedMinute: Int = 0

    var body: some View {
        ZStack {
            // Background
            Colors.Background.night
                .ignoresSafeArea()

            VStack(spacing: 0) {
                header

                ScrollView {
                    VStack(spacing: 20) {
                        reminderToggleCard
                        if manager.isEnabled || manager.permissionStatus == .authorized {
                            timePickerCard
                                .transition(.opacity.combined(with: .move(edge: .top)))
                        }
                        if manager.permissionStatus == .denied {
                            permissionDeniedCard
                                .transition(.opacity)
                        }
                        infoCard
                    }
                    .padding()
                    .animation(.easeInOut(duration: 0.25), value: manager.isEnabled)
                    .animation(.easeInOut(duration: 0.25), value: manager.permissionStatus)
                }
            }
        }
        .onAppear {
            manager.refreshPermissionStatus()
            let components = Calendar.current.dateComponents([.hour, .minute], from: manager.reminderTime)
            selectedHour   = components.hour   ?? 8
            selectedMinute = ((components.minute ?? 0) / 5) * 5
        }
    }

    // MARK: - Header

    private var header: some View {
        HStack {
            Button(action: { dismiss() }) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)
            }
            Spacer()
            Text("Daily Reminder")
                .font(.system(size: 24, weight: .bold, design: .rounded))
                .foregroundColor(.white)
            Spacer()
            Color.clear.frame(width: 44)
        }
        .padding(.horizontal)
        .frame(height: 50)
    }

    // MARK: - Toggle Card

    private var reminderToggleCard: some View {
        HStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(Colors.accentGradientDiagonal)
                    .frame(width: 48, height: 48)
                Image(systemName: "bell.fill")
                    .font(.system(size: 22))
                    .foregroundColor(.white)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text("Remind me daily")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.white)
                Text("Get a gentle nudge at your chosen time")
                    .font(.system(size: 13))
                    .foregroundColor(.white.opacity(0.6))
            }

            Spacer()

            Toggle("", isOn: reminderBinding)
                .labelsHidden()
                .tint(Colors.Palette.cyan)
        }
        .padding(20)
        .background(cardBackground(cornerRadius: 20))
    }

    // MARK: - Time Picker Card
    // Uses +/- steppers (pure SwiftUI) instead of Picker(.wheel) / DatePicker
    // to avoid the _UIReparentingView warning inside sheets.

    private var timePickerCard: some View {
        VStack(spacing: 16) {
            HStack {
                Image(systemName: "clock.fill")
                    .foregroundColor(.cyan)
                Text("Reminder time")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.white)
                Spacer()
            }

            HStack(spacing: 24) {
                // Hours
                TimeStepperUnit(
                    label: "Hour",
                    value: $selectedHour,
                    range: 0...23,
                    format: "%02d"
                )
                .onChange(of: selectedHour) { _ in syncTime() }

                Text(":")
                    .font(.system(size: 36, weight: .bold, design: .rounded))
                    .foregroundColor(.white.opacity(0.5))
                    .padding(.bottom, 16)

                // Minutes (steps of 5)
                TimeStepperUnit(
                    label: "Min",
                    value: $selectedMinute,
                    range: 0...55,
                    step: 5,
                    format: "%02d"
                )
                .onChange(of: selectedMinute) { _ in syncTime() }
            }
        }
        .padding(20)
        .background(cardBackground(cornerRadius: 20))
    }

    private func syncTime() {
        var components = DateComponents()
        components.hour   = selectedHour
        components.minute = selectedMinute
        if let date = Calendar.current.date(from: components) {
            manager.reminderTime = date
        }
    }

    // MARK: - Permission Denied Card

    private var permissionDeniedCard: some View {
        HStack(spacing: 14) {
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: 22))
                .foregroundColor(.orange)

            VStack(alignment: .leading, spacing: 4) {
                Text("Notifications disabled")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.white)
                Text("Allow notifications in Settings to use this feature.")
                    .font(.system(size: 13))
                    .foregroundColor(.white.opacity(0.7))
            }

            Spacer()

            Button("Open Settings") {
                manager.openSystemSettings()
            }
            .font(.system(size: 13, weight: .semibold))
            .foregroundColor(Colors.Palette.cyan)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.orange.opacity(0.15))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.orange.opacity(0.4), lineWidth: 1)
                )
        )
    }

    // MARK: - Info Card

    private var infoCard: some View {
        HStack(alignment: .top, spacing: 14) {
            Image(systemName: "info.circle.fill")
                .font(.system(size: 20))
                .foregroundColor(.white.opacity(0.4))
                .padding(.top, 1)

            Text("Reminders help build a consistent practice. People who meditate at the same time every day are 3× more likely to maintain their streak.")
                .font(.system(size: 13))
                .foregroundColor(.white.opacity(0.5))
                .lineSpacing(3)
        }
        .padding(16)
        .background(cardBackground(cornerRadius: 16))
    }

    // MARK: - Helpers

    /// Handles both the permission request (first time) and toggle (subsequent times)
    private var reminderBinding: Binding<Bool> {
        Binding(
            get: { manager.isEnabled },
            set: { newValue in
                if newValue {
                    switch manager.permissionStatus {
                    case .notDetermined:
                        manager.requestPermissionAndEnable()
                    case .authorized, .provisional, .ephemeral:
                        manager.isEnabled = true
                    case .denied:
                        manager.openSystemSettings()
                    @unknown default:
                        manager.requestPermissionAndEnable()
                    }
                } else {
                    manager.isEnabled = false
                }
            }
        )
    }

    private func cardBackground(cornerRadius: CGFloat) -> some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .fill(Colors.Stats.cardBackground)
    }
}

// MARK: - Time Stepper Unit

private struct TimeStepperUnit: View {
    let label: String
    @Binding var value: Int
    let range: ClosedRange<Int>
    var step: Int = 1
    let format: String

    var body: some View {
        VStack(spacing: 6) {
            Button {
                let next = value + step
                value = next > range.upperBound ? range.lowerBound : next
            } label: {
                Image(systemName: "chevron.up")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.cyan)
                    .frame(width: 44, height: 36)
                    .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.08)))
            }

            Text(String(format: format, value))
                .font(.system(size: 36, weight: .bold, design: .rounded))
                .foregroundColor(.white)
                .frame(width: 72)
                .multilineTextAlignment(.center)

            Button {
                let prev = value - step
                value = prev < range.lowerBound ? range.upperBound : prev
            } label: {
                Image(systemName: "chevron.down")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.cyan)
                    .frame(width: 44, height: 36)
                    .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.08)))
            }

            Text(label)
                .font(.system(size: 12))
                .foregroundColor(.white.opacity(0.45))
        }
    }
}

#Preview {
    NotificationSettingsView()
}
