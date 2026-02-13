//
//  FireSelectionView.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 9. 2. 2026..
//

import SwiftUI

// MARK: - Fire Selection View

struct FireSelectionView: View {
    let fireNames: [String]
    let selectedFire: String
    let onSelect: (String) -> Void
    
    var body: some View {
        VStack(spacing: 30) {
            Text(L10n.Fire.fireChoose)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.foregroudText)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    Color.clear
                        .frame(width: 10)
                    
                    ForEach(fireNames, id: \.self) { name in
                        Button {
                            onSelect(name)
                        } label: {
                            FireSelectionItem(
                                imageName: name,
                                isSelected: name == selectedFire
                            )
                            .contentShape(Rectangle())
                        }
                        .buttonStyle(.plain)
                    }
                    
                    Color.clear
                        .frame(width: 10)
                }
            }
            .fixedSize(horizontal: true, vertical: false)
        }
        .padding(.vertical)
    }
}
