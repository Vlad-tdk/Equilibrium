//
//  ThumbnailStripView.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 16. 2. 2026..
//

import SwiftUI

struct ThumbnailStripView: View {
    @ObservedObject var viewModel: CalmingImagesViewModel
    @State var viewedImages: Set<Int>
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(0..<viewModel.imageNames.count, id: \.self) { index in
                        Image(viewModel.imageNames[index])
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(
                                        viewModel.selectedIndex == index ? Color.cyan : Color.clear,
                                        lineWidth: 3
                                    )
                            )
                            .shadow(
                                color: viewModel.selectedIndex == index ? .cyan.opacity(0.5) : .black.opacity(0.3),
                                radius: 8,
                                x: 0,
                                y: 4
                            )
                            .scaleEffect(viewModel.selectedIndex == index ? 1.1 : 1.0)
                            .onTapGesture {
                                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                    viewModel.selectedIndex = index
                                }
                            }
                            .id(index)
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 16)
            }
            .background(Color.black.opacity(0.5))
            .onChange(of: viewModel.selectedIndex) { newIndex in
                viewedImages.insert(newIndex)
                withAnimation {
                    proxy.scrollTo(newIndex, anchor: .center)
                }
            }
        }
    }
}
