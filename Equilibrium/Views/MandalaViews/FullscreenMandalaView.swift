//
//  FullscreenMandalaView.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 16. 2. 2026..
//

import SwiftUI

struct FullscreenMandalaView: View {
    @ObservedObject var viewModel: MandalaViewModel
    var body: some View {
        ZStack {
            // Main mandala with rotation
            Image(viewModel.selectedMandala)
                .resizable()
                .scaledToFit()
                .rotationEffect(viewModel.rotationAngle)
            
            // Tap hint (fades out after a moment)
            if viewModel.showTapHint {
                VStack {
                    Spacer()
                    Text(L10n.Common.tapToExit)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.white.opacity(0.7))
                        .padding()
                        .background(
                            Capsule()
                                .fill(.black.opacity(0.5))
                        )
                        .padding(.bottom, 50)
                }
                .transition(.opacity)
            }
        }
        .onAppear {
            viewModel.startRotation()
        }
        .onDisappear {
            viewModel.stopRotation()
        }
    }
}
