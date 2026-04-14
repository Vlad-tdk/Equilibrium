//
//  MandalaGalleryView.swift
//  Equilibrium
//

import SwiftUI

struct MandalaGalleryView: View {
    @ObservedObject var viewModel: MandalaViewModel
    @StateObject private var favorites = FavoritesManager.shared
    @State var showInfo = false

    var body: some View {
        VStack(spacing: 0) {
            MandalaHeaderView(showInfo: showInfo)

            SelectedMandalaPreview(viewModel: viewModel)

            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.flexible(), spacing: 16),
                    GridItem(.flexible(), spacing: 16),
                    GridItem(.flexible(), spacing: 16)
                ], spacing: 16) {
                    ForEach(viewModel.mandalaNames, id: \.self) { name in
                        ZStack(alignment: .topTrailing) {
                            MandalaGridItem(
                                imageName: name,
                                isSelected: name == viewModel.selectedMandala
                            )
                            .onTapGesture {
                                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                    viewModel.selectedMandala = name
                                }
                            }

                            // Favorite button
                            Button {
                                favorites.toggleMandala(name)
                            } label: {
                                Image(systemName: favorites.isFavoriteMandala(name) ? "heart.fill" : "heart")
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundColor(favorites.isFavoriteMandala(name) ? .red : .white.opacity(0.8))
                                    .padding(6)
                                    .background(Circle().fill(.black.opacity(0.4)))
                            }
                            .padding(4)
                        }
                    }
                }
                .padding()
            }
        }
    }
}
