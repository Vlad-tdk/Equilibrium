//
//  FireMeditationView.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 30. 1. 2026..
//

import SwiftUI
import Combine

struct FireMeditationView: View {
    @StateObject private var viewModel = FireMeditationViewModel()
    @Environment(\.dismiss) private var dismiss
    @State private var showInfo = false
    
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
        .onTapGesture {
            if viewModel.isFullscreen {
                withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                    viewModel.isFullscreen = false
                }
            }
        }
        .alert("Fire Meditation", isPresented: $showInfo) {
            Button("Got it", role: .cancel) {}
        } message: {
            Text("""
            Meditating on fire carries a powerful cleansing effect.
            
            1. Close your eyes, equalize your breathing and relax
            2. Direct your gaze to the flame and focus all of your attention
            3. Visualize yourself being consumed by the fire. It fills the body, cleansing and soothing
            4. Feel how it destroys negative energy
            5. If your eyes are watering, close them for a while
            6. After finishing, exhale deeply and return to your normal state
            
            You will feel cleansed of negative energies and clarity of consciousness.
            """)
        }
    }
    
    private var fullscreenView: some View {
        ZStack {
            // Fire GIF with scaling animation
            AnimatedFireView(imageName: viewModel.selectedFire)
                .scaleEffect(viewModel.fireScale)
                .animation(
                    .easeInOut(duration: 4.0)
                    .repeatForever(autoreverses: true),
                    value: viewModel.fireScale
                )
                .onAppear {
                    viewModel.fireScale = 1.1
                }
            
            // Tap hint
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
            
            // Selected fire preview
            selectedFirePreview
            
            // Fire selection
            fireSelection
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
            
            Text("Fire Meditation")
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
    
    private var selectedFirePreview: some View {
        VStack(spacing: 16) {
            AnimatedFireView(imageName: viewModel.selectedFire)
                .frame(height: 400)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(color: .orange.opacity(0.5), radius: 20, x: 0, y: 0)
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
    
    private var fireSelection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Choose your flame")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(viewModel.fireNames, id: \.self) { name in
                        FireSelectionItem(
                            imageName: name,
                            isSelected: name == viewModel.selectedFire
                        )
                        .onTapGesture {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                viewModel.selectedFire = name
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(.vertical)
    }
}

// MARK: - Fire Selection Item
struct FireSelectionItem: View {
    let imageName: String
    let isSelected: Bool
    
    var body: some View {
        AnimatedFireView(imageName: imageName)
            .frame(width: 120, height: 160)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(
                        isSelected ? Color.orange : Color.clear,
                        lineWidth: isSelected ? 3 : 0
                    )
            )
            .shadow(color: isSelected ? .orange.opacity(0.5) : .black.opacity(0.3), radius: 8, x: 0, y: 4)
            .scaleEffect(isSelected ? 1.05 : 1.0)
            .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isSelected)
    }
}

// MARK: - Animated Fire View (GIF placeholder)
struct AnimatedFireView: View {
    let imageName: String
    
    var body: some View {
        // Note: In production, use actual GIF loading library
        // For now, using static images as placeholder
        Image(systemName: "flame.fill")
            .resizable()
            .scaledToFit()
            .foregroundStyle(
                LinearGradient(
                    colors: [.orange, .red, .yellow],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
    }
}

// MARK: - Preview
#Preview {
    FireMeditationView()
}
