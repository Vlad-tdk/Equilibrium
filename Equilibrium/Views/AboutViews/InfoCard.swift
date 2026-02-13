//
//  InfoCard.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 9. 2. 2026..
//

import SwiftUI

// MARK: - Info Card
struct InfoCard: View {
    let title: LocalizedStringKey
    let text: LocalizedStringKey
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .foregroundColor(.white)
            
            Text(text)
                .font(.system(size: 15))
                .foregroundColor(.white.opacity(0.8))
                .lineSpacing(6)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.white.opacity(0.1))
        )
    }
}
