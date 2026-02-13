//
//  FireHeaderView.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 9. 2. 2026..
//

import SwiftUI

// MARK: - Fire Header View

struct FireHeaderView: View {
    @Binding var showInfo: Bool
    let onDismiss: () -> Void
    
    var body: some View {
        HStack(spacing: 50) {
            Button(action: onDismiss) {
                Image(systemName: Icons.leftArrow)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.foregroudText)
                    .frame(width: 44, height: 44)
            }
            
            Text(L10n.Fire.fireTitle)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .foregroundColor(.foregroudText)
                .layoutPriority(1)
            
            Button(action: { showInfo = true }) {
                Image(systemName: Icons.about)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.foregroudText)
                    .frame(width: 44, height: 44)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(.fireHeaderBackground)
        .fixedSize(horizontal: true, vertical: false)
    }
}

