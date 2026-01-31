//
//  EquilibriumApp.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 30. 1. 2026..
//

import SwiftUI
import Combine

@main
struct EquilibriumApp: App {
    @StateObject private var appState = AppStateManager()
    
    var body: some Scene {
        WindowGroup {
            AppRootView()
                .environmentObject(appState)
        }
    }
}

// MARK: - App State Manager
class AppStateManager: ObservableObject {
    @Published var currentScreen: AppScreen = .launch
    
    enum AppScreen {
        case launch
        case onboarding
        case main
    }
    
    init() {
        checkOnboardingStatus()
    }
    
    private func checkOnboardingStatus() {
        let hasSeenOnboarding = UserDefaults.standard.bool(forKey: "hasSeenOnboarding")
        currentScreen = hasSeenOnboarding ? .main : .onboarding
    }
    
    func completeLaunch() {
        currentScreen = currentScreen == .onboarding ? .onboarding : .main
    }
    
    func completeOnboarding() {
        currentScreen = .main
    }
}

// MARK: - App Root View
struct AppRootView: View {
    @EnvironmentObject var appState: AppStateManager
    
    var body: some View {
        Group {
            switch appState.currentScreen {
            case .launch:
                LaunchScreenView {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        appState.completeLaunch()
                    }
                }
                
            case .onboarding:
                OnboardingView {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        appState.completeOnboarding()
                    }
                }
                
            case .main:
                MainView()
            }
        }
        .transition(.opacity)
    }
}
