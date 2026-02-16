//
//  MandalaView.swift
//  Equilibrium
//
//  Created by Vlad on 30. 1. 2026..
//

import SwiftUI
import Combine

struct MandalaView: View {
    @StateObject private var viewModel = MandalaViewModel()
    @Environment(\.dismiss) private var dismiss
    @State private var showInfo = false
    @State private var sessionStartTime: Date?
    @State private var viewedMandalas = Set<String>()
    
    
    var body: some View {
        ZStack {
            // Background
            Color.backgroundView
                .ignoresSafeArea()
            
            if viewModel.isFullscreen {
                // Fullscreen mandala view
                FullscreenMandalaView(viewModel: viewModel)
                    .onAppear {
                        sessionStartTime = Date()
                        viewedMandalas.removeAll()
                    }
                    .onDisappear {
                        if let startTime = sessionStartTime {
                            let duration = Date().timeIntervalSince(startTime)
                            StatisticsManager.shared.trackMandalaSession(
                                duration: duration,
                                mandalasViewed: viewedMandalas.count
                            )
                        }
                    }
            } else {
                // Gallery view
                MandalaGalleryView(viewModel: viewModel)
            }
        }
        .navigationBarHidden(true)
        .statusBarHidden(viewModel.isFullscreen)
        .onTapGesture {
            if viewModel.isFullscreen {
                withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                    viewModel.isFullscreen = false
                }
            }
        }
    }
}

// MARK: - Preview
#Preview {
    MandalaView()
}
