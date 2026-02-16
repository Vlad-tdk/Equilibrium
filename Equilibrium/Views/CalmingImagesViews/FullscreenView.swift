//
//  FullscreenView.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 16. 2. 2026..
//

import SwiftUI

struct FullscreenView: View {
    @ObservedObject var viewModel: CalmingImagesViewModel
    var body: some View {
        ZStack {
            TabView(selection: $viewModel.selectedIndex) {
                ForEach(0..<viewModel.imageNames.count, id: \.self) { index in
                    Image(viewModel.imageNames[index])
                        .resizable()
                        .scaledToFill()
                        .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .automatic))
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            
            VStack {
                HStack {
                    Button(action: {
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                            viewModel.isFullscreen = false
                        }
                    }) {
                        Image(systemName: Icons.xmark)
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.buttonClose)
                            .padding(12)
                            .background(Circle().fill(.backgroundButton))
                    }
                    .padding()
                    
                    Spacer()
                }
                
                Spacer()
            }
        }
    }
}
