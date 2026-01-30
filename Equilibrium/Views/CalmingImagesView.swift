//
//  CalmingImagesView.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 30. 1. 2026..
//

import SwiftUI
import Combine

struct CalmingImagesView: View {
    @StateObject private var viewModel = CalmingImagesViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            if viewModel.isFullscreen {
                fullscreenView
            } else {
                galleryView
            }
        }
        .navigationBarHidden(true)
        .statusBarHidden(viewModel.isFullscreen)
    }
    
    private var fullscreenView: some View {
        ZStack {
            TabView(selection: $viewModel.selectedIndex) {
                ForEach(0..<viewModel.imageNames.count, id: \.self) { index in
                    Image(viewModel.imageNames[index])
                        .resizable()
                        .scaledToFit()
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
                        Image(systemName: "xmark")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.white)
                            .padding(12)
                            .background(Circle().fill(.black.opacity(0.5)))
                    }
                    .padding()
                    
                    Spacer()
                }
                
                Spacer()
            }
        }
    }
    
    private var galleryView: some View {
        VStack(spacing: 0) {
            // Header
            header
            
            // Main image viewer
            mainImageViewer
            
            // Thumbnail strip
            thumbnailStrip
        }
    }
    
    private var header: some View {
        HStack {
            Button(action: { dismiss() }) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            Text("Calming Images")
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .foregroundColor(.white)
            
            Spacer()
            
            Button(action: {
                withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                    viewModel.isFullscreen = true
                }
            }) {
                Image(systemName: "arrow.up.left.and.arrow.down.right")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)
            }
        }
        .padding()
        .background(Color.black.opacity(0.3))
    }
    
    private var mainImageViewer: some View {
        TabView(selection: $viewModel.selectedIndex) {
            ForEach(0..<viewModel.imageNames.count, id: \.self) { index in
                ZStack {
                    Image(viewModel.imageNames[index])
                        .resizable()
                        .scaledToFit()
                        .tag(index)
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(maxHeight: .infinity)
    }
    
    private var thumbnailStrip: some View {
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
                withAnimation {
                    proxy.scrollTo(newIndex, anchor: .center)
                }
            }
        }
    }
}

// MARK: - Preview
#Preview {
    CalmingImagesView()
}
