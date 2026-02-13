//
//  FireMeditationView.swift
//  Equilibrium
//
//  Created by Vlad on 30. 1. 2026..
//

import SwiftUI
import Combine

struct FireMeditationView: View {
    @StateObject private var viewModel = FireMeditationViewModel()
    @Environment(\.dismiss) private var dismiss
    @State private var showInfo = false
    @State private var sessionStartTime: Date?
    
    var body: some View {
        ZStack {
            Color.fireBackgroundView
                .ignoresSafeArea()
            
            if viewModel.isFullscreen {
                FireFullscreenView(
                    viewModel: viewModel,
                    sessionStartTime: $sessionStartTime,
                    onExit: handleFullscreenExit
                )
            } else {
                VStack {
                    FireGalleryView(
                        viewModel: viewModel,
                        showInfo: $showInfo,
                        onDismiss: { dismiss() },
                        onEnterFullscreen: handleEnterFullscreen
                    )
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .navigationBarHidden(true)
        .statusBarHidden(viewModel.isFullscreen)
        .alert(L10n.Fire.alertFireTitle, isPresented: $showInfo) {
            Button(L10n.Common.gotIt, role: .cancel) {}
        } message: {
            Text(L10n.Fire.alertFireMessage)
        }
    }
    
    // MARK: - Actions
    
    private func handleEnterFullscreen() {
        withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
            viewModel.isFullscreen = true
            viewModel.showTapHint = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    viewModel.showTapHint = false
                }
            }
        }
    }
    
    private func handleFullscreenExit() {
        if let startTime = sessionStartTime {
            let duration = Date().timeIntervalSince(startTime)
            StatisticsManager.shared.trackFireSession(duration: duration)
        }
        withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
            viewModel.isFullscreen = false
        }
    }
}

// MARK: - Preview

#Preview {
    FireMeditationView()
}
