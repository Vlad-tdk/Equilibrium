//
//  MainView.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 30. 1. 2026..
//

import SwiftUI
import Combine

struct MainView: View {
    @StateObject private var audioPlayer = AudioPlayerManager()
    @State private var selectedTab: Int = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                // Animated gradient background
                AnimatedGradientBackground()
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Header
                    header
                    
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
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private var header: some View {
        VStack(spacing: 8) {
            Text("Equilibrium")
                .font(.system(size: 36, weight: .bold, design: .rounded))
                .foregroundStyle(
                    LinearGradient(
                        colors: [.white, .white.opacity(0.8)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            
            Text("Find your inner peace")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white.opacity(0.8))
            
            // Music control button
            Button(action: {
                audioPlayer.togglePlayback()
            }) {
                HStack(spacing: 8) {
                    Image(systemName: audioPlayer.isPlaying ? "pause.circle.fill" : "play.circle.fill")
                        .font(.system(size: 20))
                    Text(audioPlayer.isPlaying ? "Pause Music" : "Play Music")
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
            .padding(.top, 8)
        }
        .padding(.top, 50)
        .padding(.bottom, 20)
    }
}

// MARK: - Preview
#Preview {
    MainView()
}
