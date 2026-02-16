//
//  MandalaGalleryView.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 16. 2. 2026..
//

import SwiftUI

struct MandalaGalleryView: View {
    @ObservedObject var viewModel: MandalaViewModel
    @State var showInfo = false
    @State private var viewedMandalas = Set<String>()
    var body: some View {
        VStack(spacing: 0) {
            // Header
            MandalaHeaderView(showInfo: showInfo)
            
            // Selected mandala preview
            SelectedMandalaPreview(viewModel: viewModel)
            
            // Mandala gallery
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.flexible(), spacing: 16),
                    GridItem(.flexible(), spacing: 16),
                    GridItem(.flexible(), spacing: 16)
                ], spacing: 16) {
                    ForEach(viewModel.mandalaNames, id: \.self) { name in
                        MandalaGridItem(
                            imageName: name,
                            isSelected: name == viewModel.selectedMandala
                        )
                        .onTapGesture {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                viewModel.selectedMandala = name
                                viewedMandalas.insert(viewModel.selectedMandala)
                                StatisticsManager.shared.trackMandalaSession(
                                    duration: 0,
                                    mandalasViewed: viewedMandalas.count
                                )
                            }
                        }
                    }
                }
                .padding()
            }
        }
    }
}
