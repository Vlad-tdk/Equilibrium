//
//  FireFullscreenView.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 9. 2. 2026..
//

import SwiftUI

// MARK: - Fire Fullscreen View

struct FireFullscreenView: View {
    @ObservedObject var viewModel: FireMeditationViewModel
    @Binding var sessionStartTime: Date?
    let onExit: () -> Void
    
    var body: some View {
        ZStack {
            // Fire GIF with scaling animation
            GIFImageView(gifName: viewModel.selectedFire, contentMode: .scaleAspectFit)
                .id("fullscreen_\(viewModel.selectedFire)_\(viewModel.isFullscreen ? "on" : "off")")
                .ignoresSafeArea()
                .animation(
                    .easeInOut(duration: FireConstants.scaleAnimationDuration)
                    .repeatForever(autoreverses: true),
                    value: viewModel.fireScale
                )
                .onAppear {
                    viewModel.fireScale = FireConstants.maxScale
                    sessionStartTime = Date()
                }
            // Tap hint
            if viewModel.showTapHint {
                VStack {
                    Spacer()
                    Text(L10n.Common.tapToExit)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.foregroundOpacity)
                        .padding()
                        .background(
                            Capsule()
                                .fill(.fireOverlay)
                        )
                        .padding(.bottom, 50)
                }
                .transition(.opacity)
            }
                
            Color.clear
                .contentShape(Rectangle())
                .ignoresSafeArea()
                .onTapGesture {
                    onExit()
                }
        }
        .contentShape(Rectangle())
        .onChange(of: viewModel.isFullscreen) { newValue in
            if newValue {
                viewModel.fireScale = FireConstants.minScale
                DispatchQueue.main.async {
                    withAnimation(
                        .easeInOut(duration: FireConstants.scaleAnimationDuration)
                        .repeatForever(autoreverses: true)
                    ) {
                        viewModel.fireScale = FireConstants.maxScale
                    }
                }
            }
        }
    }
}
