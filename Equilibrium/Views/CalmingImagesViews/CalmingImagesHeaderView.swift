//
//  CalmingImagesHeaderView.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 16. 2. 2026..
//

import SwiftUI

struct CalmingImagesHeaderView: View {
    @ObservedObject var viewModel: CalmingImagesViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        HStack {
            Button(action: {
                dismiss()
            }) {
                Image(systemName: Icons.leftArrow)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.foregroudText)
            }
            
            Spacer()
            
            Text(L10n.CalmingImagesView.textTitle)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .foregroundColor(.foregroudText)
            
            Spacer()
            
            Button(action: {
                withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                    viewModel.isFullscreen = true
                }
            }) {
                Image(systemName: Icons.arrowUpLeftAndArrowDownRight)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.foregroudText)
            }
        }
        .padding()
        .background(.backgroundHeader)
    }
}
