//
//  MainView.swift
//  Equilibrium
//
//  Created by Vlad on 30. 1. 2026..
//

import SwiftUI
import Combine

struct MainView: View {
    @StateObject private var audioPlayer = AudioPlayerManager()
    @State private var showShareSheet = false
    @State private var showNotificationSettings = false
    
    var body: some View {
        NavigationView {
            ZStack {
                // Animated gradient background
                AnimatedGradientBackground()
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Header
                    header
                        .frame(height: 160)
                    
                    // Main content
                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach(MeditationType.allCases) { type in
                                MeditationCard(type: type)
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationBarHidden(true)
            .sheet(isPresented: $showNotificationSettings) {
                NotificationSettingsView()
            }
            .sheet(isPresented: $showShareSheet) {
                ShareSheet(items: [
                    "Finding peace with Equilibrium - meditation & breathing app",
                    URL(string: "https://apps.apple.com/app/id6470206215")!
                ])
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private var header: some View {
        VStack(spacing: 8) {
            HStack {
                // Statistics button
                NavigationLink(destination: StatisticsView()) {
                    Image(systemName: Icons.chartBarXaxisDescending)
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.white.opacity(0.8))
                        .padding(8)
                }
                .accessibilityLabel("Statistics")
                
                Spacer()
                
                Text(L10n.Home.homeHeader)
                    .font(.system(size: 36, weight: .bold, design: .rounded))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.white, .white.opacity(0.8)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                
                Spacer()
                
                // Menu: Share + Notifications
                Menu {
                    Button {
                        showShareSheet = true
                    } label: {
                        Label("Share app", systemImage: Icons.squareAndArrowUp)
                    }

                    Button {
                        showNotificationSettings = true
                    } label: {
                        Label("Daily reminder", systemImage: "bell.fill")
                    }
                } label: {
                    Image(systemName: "ellipsis.circle")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.white.opacity(0.8))
                        .padding(8)
                }
                .accessibilityLabel("More options")
            }
            .padding(.horizontal)
            
            
            
            Text(L10n.Home.findInnerPeace)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white.opacity(0.8))
            
            // Music control button
            Button(action: {
                audioPlayer.togglePlayback()
            }) {
                HStack(spacing: 8) {
                    Image(systemName: audioPlayer.isPlaying ? Icons.play : Icons.pause)
                        .font(.system(size: 20))
                        .accessibilityHidden(true)
                    Text(audioPlayer.isPlaying ? L10n.Home.pauseMusic : L10n.Home.playMusic)
                        .font(.system(size: 14, weight: .semibold))
                }
                .foregroundColor(.white)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(
                    Capsule()
                        .fill(.white.opacity(0.2))
                        .overlay(
                            Capsule()
                                .stroke(Color.white.opacity(0.3), lineWidth: 1)
                        )
                )
            }
            .accessibilityLabel(audioPlayer.isPlaying ? "Pause background music" : "Play background music")
            //.padding(.top, 8)
        }
        .padding(.top, 50)
        .padding(.bottom, 20)
    }
}

// MARK: - Preview
#Preview {
    MainView()
}
