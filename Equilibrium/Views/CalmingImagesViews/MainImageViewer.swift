//
//  MainImageViewer.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 16. 2. 2026..
//

import SwiftUI

struct MainImageViewer: View {
    @ObservedObject var viewModel: CalmingImagesViewModel
    var body: some View {
        TabView(selection: $viewModel.selectedIndex) {
            ForEach(0..<viewModel.imageNames.count, id: \.self) { index in
                ZStack {
                    Image(viewModel.imageNames[index])
                        .resizable()
                        .scaledToFill()
                        .tag(index)
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(maxHeight: .infinity)
    }
}
