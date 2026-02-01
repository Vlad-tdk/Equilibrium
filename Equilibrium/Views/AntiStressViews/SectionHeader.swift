//
//  SectionHeader.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 1. 2. 2026..
//

import SwiftUI

// MARK: - Section Header
struct SectionHeader: View {
    let title: LocalizedStringResource
    let icon: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.cyan)
            Text(String(localized: title))
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
            Spacer()
        }
    }
}
