//
//  Firemeditationsubviews.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 9. 2. 2026..
//

import SwiftUI

// MARK: - Fire Gallery View

struct FireGalleryView: View {
    @ObservedObject var viewModel: FireMeditationViewModel
    @Binding var showInfo: Bool
    let onDismiss: () -> Void
    let onEnterFullscreen: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            FireHeaderView(
                showInfo: $showInfo,
                onDismiss: onDismiss
            )
            .id("static_header")
            
            FirePreviewView(
                selectedFire: viewModel.selectedFire,
                onTap: onEnterFullscreen
            )
            
            FireSelectionView(
                fireNames: viewModel.fireNames,
                selectedFire: viewModel.selectedFire,
                onSelect: { name in
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                        viewModel.selectedFire = name
                    }
                }
            )
        }
    }
}
