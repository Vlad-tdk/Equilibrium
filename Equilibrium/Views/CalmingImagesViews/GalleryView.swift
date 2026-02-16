//
//  GalleryView.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 16. 2. 2026..
//

import SwiftUI

struct GalleryView: View {
    @ObservedObject var viewModel: CalmingImagesViewModel
    @State var viewedImages: Set<Int>
    var body: some View {
        VStack(spacing: 0) {
            // Header
            CalmingImagesHeaderView(viewModel: viewModel)
            
            // Main image viewer
            MainImageViewer(viewModel: viewModel)
            
            // Thumbnail strip
            ThumbnailStripView(viewModel: viewModel, viewedImages: viewedImages)
        }
    }
}
