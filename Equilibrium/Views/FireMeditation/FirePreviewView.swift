//
//  FirePreviewView.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 9. 2. 2026..
//

import SwiftUI

// MARK: - Fire Preview View

struct FirePreviewView: View {
    let selectedFire: String
    let onTap: () -> Void
    
    var body: some View {
        VStack {
            Button(action: onTap) {
                VStack(spacing: 16) {
                    GIFImageView(gifName: selectedFire, contentMode: .scaleAspectFill)
                        .frame(height: FireConstants.previewHeight)
                        .frame(maxWidth: .infinity)
                        .clipShape(RoundedRectangle(cornerRadius: FireConstants.previewCornerRadius))
                        .shadow(color: .shadow, radius: 20, x: 0, y: 0)
                        .contentShape(Rectangle())
                    
                    Text(L10n.Common.tapToMeditate)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.foregroundOpacity)
                }
                .padding(.vertical, 20)
            }
            .buttonStyle(.plain)
        }
    }
}
