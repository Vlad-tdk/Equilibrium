//
//  MandalaHeaderView.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 16. 2. 2026..
//

import SwiftUI

struct MandalaHeaderView: View {
    @Environment(\.dismiss) private var dismiss
    @State var showInfo: Bool
    var body: some View {
            HStack {
                Button(action: { dismiss() }) {
                    Image(systemName: Icons.leftArrow)
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.foregroudText)
                }
                
                Spacer()
                
                Text(L10n.Mandala.mandalaTitle)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundColor(.foregroudText)
                
                Spacer()
                
                Button(action: { showInfo = true }) {
                    Image(systemName: Icons.about)
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.foregroudText)
                }
            }
            .padding()
            .background(.backgroundHeader)
            .alert(L10n.Mandala.alertMandalaTitle, isPresented: $showInfo) {
                Button(L10n.Common.gotIt, role: .cancel) {}
            } message: {
                Text(L10n.Mandala.alertMandalaMessage)
            }
    }
}
