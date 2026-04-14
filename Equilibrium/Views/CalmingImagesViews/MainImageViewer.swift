//
//  MainImageViewer.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 16. 2. 2026..
//

import SwiftUI

struct MainImageViewer: View {
    @ObservedObject var viewModel: CalmingImagesViewModel
    @StateObject private var favorites = FavoritesManager.shared

    var body: some View {
        ZStack(alignment: .topTrailing) {
            TabView(selection: $viewModel.selectedIndex) {
                ForEach(0..<viewModel.imageNames.count, id: \.self) { index in
                    Image(viewModel.imageNames[index])
                        .resizable()
                        .scaledToFill()
                        .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(maxHeight: .infinity)

            Button {
                favorites.toggleImage(viewModel.selectedIndex)
            } label: {
                Image(systemName: favorites.isFavoriteImage(viewModel.selectedIndex) ? "heart.fill" : "heart")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(favorites.isFavoriteImage(viewModel.selectedIndex) ? .red : .white)
                    .padding(10)
                    .background(Circle().fill(.black.opacity(0.35)))
            }
            .padding(.top, 12)
            .padding(.trailing, 16)
        }
    }
}
