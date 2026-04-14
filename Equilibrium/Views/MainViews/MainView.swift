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
    @StateObject private var customTracks = CustomTrackManager.shared
    @State private var showNotificationSettings = false
    @State private var showCustomTracks = false

    private let appStoreURL = URL(string: "https://apps.apple.com/app/id6470206215")!

    var body: some View {
        NavigationView {
            ZStack {
                AnimatedGradientBackground()
                    .ignoresSafeArea()

                VStack(spacing: 0) {
                    header
                        .frame(height: 160)

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
            .sheet(isPresented: $showCustomTracks) {
                CustomTracksSheet(audioPlayer: audioPlayer)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    // MARK: - Header

    private var header: some View {
        VStack(spacing: 8) {
            HStack {
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

                Menu {
                    // Share — UIActivityViewController presented via UIKit directly,
                    // not through a SwiftUI sheet, so no _UIReparentingView.
                    Button {
                        shareApp()
                    } label: {
                        Label("Share app", systemImage: Icons.squareAndArrowUp)
                    }

                    Button {
                        showNotificationSettings = true
                    } label: {
                        Label("Daily reminder", systemImage: "bell.fill")
                    }

                    // Ambient sound submenu
                    Menu {
                        ForEach(AmbientTrack.allCases, id: \.self) { track in
                            Button {
                                audioPlayer.selectBuiltin(track)
                            } label: {
                                let isActive = audioPlayer.activeCustomTrack == nil
                                    && audioPlayer.currentTrack == track
                                Label(
                                    track.displayName,
                                    systemImage: isActive ? "checkmark" : track.icon
                                )
                            }
                        }

                        if !customTracks.tracks.isEmpty {
                            Divider()
                            ForEach(customTracks.tracks) { track in
                                Button {
                                    audioPlayer.selectCustom(track)
                                } label: {
                                    let isActive = audioPlayer.activeCustomTrack?.id == track.id
                                    Label(
                                        track.displayName,
                                        systemImage: isActive ? "checkmark" : "music.note"
                                    )
                                }
                            }
                        }

                        Divider()

                        Button {
                            showCustomTracks = true
                        } label: {
                            Label(
                                customTracks.tracks.isEmpty ? "Add track" : "Manage tracks",
                                systemImage: customTracks.tracks.isEmpty ? "plus.circle" : "slider.horizontal.3"
                            )
                        }
                    } label: {
                        Label("Ambient sound", systemImage: "music.note")
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
            Button(action: { audioPlayer.togglePlayback() }) {
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
                        .overlay(Capsule().stroke(Color.white.opacity(0.3), lineWidth: 1))
                )
            }
            .accessibilityLabel(audioPlayer.isPlaying ? "Pause background music" : "Play background music")
        }
        .padding(.top, 50)
        .padding(.bottom, 20)
    }

    // MARK: - Share

    /// Presents UIActivityViewController directly via UIKit, bypassing SwiftUI's sheet
    /// system. This avoids _UIReparentingView because UIActivityViewController never
    /// touches UIHostingController.view.
    private func shareApp() {
        let items: [Any] = [
            "Finding peace with Equilibrium - meditation & breathing app",
            appStoreURL
        ]
        let vc = UIActivityViewController(activityItems: items, applicationActivities: nil)

        guard
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let window = windowScene.windows.first(where: { $0.isKeyWindow }),
            let rootVC = window.rootViewController
        else { return }

        var topVC = rootVC
        while let next = topVC.presentedViewController { topVC = next }
        topVC.present(vc, animated: true)
    }
}

// MARK: - Preview
#Preview {
    MainView()
}
