//
//  CalmingImagesView.swift
//  Equilibrium
//
//  Created by Vlad on 30. 1. 2026..
//

import SwiftUI
import Combine

struct CalmingImagesView: View {
    @StateObject private var viewModel = CalmingImagesViewModel()
    @State private var sessionStartTime: Date?
    @State private var viewedImages = Set<Int>()
    
    var body: some View {
        ZStack {
            Color.backgroundCalming
                .ignoresSafeArea()
            
            if viewModel.isFullscreen {
                FullscreenView(viewModel: viewModel)
            } else {
                GalleryView(viewModel: viewModel, viewedImages: viewedImages)
            }
        }
        .navigationBarHidden(true)
        .statusBarHidden(viewModel.isFullscreen)
        .onAppear {
            sessionStartTime = Date()
            viewedImages.removeAll()
        }
        .onDisappear {
            if let startTime = sessionStartTime {
                let duration = Date().timeIntervalSince(startTime)
                StatisticsManager.shared.trackImagesSession(
                    duration: duration,
                    imagesViewed: viewedImages.count
                )
            }
        }
    }
}

// MARK: - Preview
#Preview {
    CalmingImagesView()
}
