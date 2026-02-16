//
//  SelectedMandalaPreview.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 16. 2. 2026..
//

import SwiftUI

struct SelectedMandalaPreview:View {
    @ObservedObject var viewModel: MandalaViewModel
    var body: some View {
        VStack(spacing: 16) {
            Image(viewModel.selectedMandala)
                .resizable()
                .scaledToFit()
                .frame(height: 250)
                .clipShape(Circle())
                .shadow(color: .shadowSelected, radius: 20, x: 0, y: 0)

            Text(L10n.Common.tapToMeditate)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.foregroundOpacity)
        }
        .padding(.vertical, 20)
        .onTapGesture {
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
    }
}

