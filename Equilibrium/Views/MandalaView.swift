//
//  MandalaView.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 30. 1. 2026..
//

import SwiftUI
import Combine

struct MandalaView: View {
    @StateObject private var viewModel = MandalaViewModel()
    @Environment(\.dismiss) private var dismiss
    @State private var showInfo = false
    
    var body: some View {
        ZStack {
            // Background
            Color.black
                .ignoresSafeArea()
            
            if viewModel.isFullscreen {
                // Fullscreen mandala view
                fullscreenMandalaView
            } else {
                // Gallery view
                galleryView
            }
        }
        .navigationBarHidden(true)
        .statusBarHidden(viewModel.isFullscreen)
        .onTapGesture {
            if viewModel.isFullscreen {
                withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                    viewModel.isFullscreen = false
                }
            }
        }
        .alert("Mandala Meditation", isPresented: $showInfo) {
            Button("Got it", role: .cancel) {}
        } message: {
            Text("""
            Mandala meditation balances the emotional state and allows you to work purposefully.
            
            1. Choose a mandala that speaks to you
            2. Tap to enter fullscreen mode
            3. Focus on the center
            4. Let your mind relax
            
            The mandala will gently rotate, helping you achieve a meditative state.
            """)
        }
    }
    
    private var fullscreenMandalaView: some View {
        ZStack {
            // Main mandala with rotation
            Image(viewModel.selectedMandala)
                .resizable()
                .scaledToFit()
                .rotationEffect(viewModel.rotationAngle)
                .onAppear {
                    viewModel.startRotation()
                }
                .onDisappear {
                    viewModel.stopRotation()
                }
            
            // Tap hint (fades out after a moment)
            if viewModel.showTapHint {
                VStack {
                    Spacer()
                    Text("Tap to exit")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.white.opacity(0.7))
                        .padding()
                        .background(
                            Capsule()
                                .fill(.black.opacity(0.5))
                        )
                        .padding(.bottom, 50)
                }
                .transition(.opacity)
            }
        }
    }
    
    private var galleryView: some View {
        VStack(spacing: 0) {
            // Header
            header
            
            // Selected mandala preview
            selectedMandalaPreview
            
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
                            }
                        }
                    }
                }
                .padding()
            }
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
            
            Text("Mandala Meditation")
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .foregroundColor(.white)
            
            Spacer()
            
            Button(action: { showInfo = true }) {
                Image(systemName: "info.circle")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)
            }
        }
        .padding()
        .background(Color.black.opacity(0.3))
    }
    
    private var selectedMandalaPreview: some View {
        VStack(spacing: 16) {
            Image(viewModel.selectedMandala)
                .resizable()
                .scaledToFit()
                .frame(height: 250)
                .clipShape(Circle())
                .shadow(color: .purple.opacity(0.5), radius: 20, x: 0, y: 0)
                .onTapGesture {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                        viewModel.isFullscreen = true
                        viewModel.showTapHint = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            withAnimation {
                                viewModel.showTapHint = false
                            }
                        }
                    }
                }
            
            Text("Tap to meditate")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white.opacity(0.7))
        }
        .padding(.vertical, 20)
    }
}

// MARK: - Mandala Grid Item
struct MandalaGridItem: View {
    let imageName: String
    let isSelected: Bool
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(width: 100, height: 100)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(
                        isSelected ? Color.purple : Color.clear,
                        lineWidth: isSelected ? 3 : 0
                    )
            )
            .shadow(color: isSelected ? .purple.opacity(0.5) : .black.opacity(0.3), radius: 8, x: 0, y: 4)
            .scaleEffect(isSelected ? 1.05 : 1.0)
            .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isSelected)
    }
}

// MARK: - Preview
#Preview {
    MandalaView()
}
