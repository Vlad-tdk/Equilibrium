//
//  NotificationManager.swift
//  Equilibrium
//

import UserNotifications
import SwiftUI
import Combine

class NotificationManager: ObservableObject {
    static let shared = NotificationManager()

    @Published var isEnabled: Bool {
        didSet {
            UserDefaults.standard.set(isEnabled, forKey: Keys.isEnabled)
            if isEnabled { scheduleDailyReminder() } else { cancelAll() }
        }
    }

    @Published var reminderTime: Date {
        didSet {
            UserDefaults.standard.set(reminderTime, forKey: Keys.reminderTime)
            if isEnabled { scheduleDailyReminder() }
        }
    }

    @Published var permissionStatus: UNAuthorizationStatus = .notDetermined

    private enum Keys {
        static let isEnabled     = "notification_enabled"
        static let reminderTime  = "notification_reminder_time"
    }

    private static let notificationID = "equilibrium_daily_reminder"

    private init() {
        isEnabled = UserDefaults.standard.bool(forKey: Keys.isEnabled)
        if let saved = UserDefaults.standard.object(forKey: Keys.reminderTime) as? Date {
            reminderTime = saved
        } else {
            // Default: 8:00 AM
            var components = DateComponents()
            components.hour = 8
            components.minute = 0
            reminderTime = Calendar.current.date(from: components) ?? Date()
        }
        refreshPermissionStatus()
    }

    // MARK: - Public API

    func refreshPermissionStatus() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            DispatchQueue.main.async {
                self.permissionStatus = settings.authorizationStatus
                if settings.authorizationStatus == .denied {
                    self.isEnabled = false
                }
            }
        }
    }

    func requestPermissionAndEnable() {
        UNUserNotificationCenter.current().requestAuthorization(
            options: [.alert, .sound]
        ) { granted, _ in
            DispatchQueue.main.async {
                self.permissionStatus = granted ? .authorized : .denied
                self.isEnabled = granted
            }
        }
    }

    func openSystemSettings() {
        guard let url = URL(string: UIApplication.openSettingsURLString) else { return }
        UIApplication.shared.open(url)
    }

    // MARK: - Private

    private func scheduleDailyReminder() {
        UNUserNotificationCenter.current().removePendingNotificationRequests(
            withIdentifiers: [Self.notificationID]
        )

        let content = UNMutableNotificationContent()
        content.title = "Time to find your balance 🌿"
        content.body  = "A few minutes of calm can change your whole day."
        content.sound = .default

        let components = Calendar.current.dateComponents([.hour, .minute], from: reminderTime)
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
        let request = UNNotificationRequest(
            identifier: Self.notificationID,
            content: content,
            trigger: trigger
        )

        UNUserNotificationCenter.current().add(request)
    }

    private func cancelAll() {
        UNUserNotificationCenter.current().removePendingNotificationRequests(
            withIdentifiers: [Self.notificationID]
        )
    }
}
