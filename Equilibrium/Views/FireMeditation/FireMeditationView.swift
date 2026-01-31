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
                VStack{
                    galleryView
                        .frame(maxWidth: .infinity)
                }
            }
        }
        .navigationBarHidden(true)
        .statusBarHidden(viewModel.isFullscreen)
        .alert(L10n.Fire.alertFireTitle, isPresented: $showInfo) {
            Button(L10n.Common.gotIt, role: .cancel) {}
        } message: {
            Text(L10n.Fire.alertFireMessage)
        }
    }
    
    private var fullscreenView: some View {
        ZStack {
            // Fire GIF with scaling animation
            GIFImageView(gifName: viewModel.selectedFire, contentMode: .scaleAspectFit)
                .id("fullscreen_\(viewModel.selectedFire)_\(viewModel.isFullscreen ? "on" : "off")")
                .ignoresSafeArea()
            
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
                    Text(L10n.Common.tapToExit)
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
            
            Color.clear
                .contentShape(Rectangle())
                .ignoresSafeArea()
                .onTapGesture {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                        viewModel.isFullscreen = false
                    }
                }
        }
        .contentShape(Rectangle())
        .onChange(of: viewModel.isFullscreen) { newValue in
            if newValue {
                viewModel.fireScale = 1.0
                DispatchQueue.main.async {
                    withAnimation(.easeInOut(duration: 4.0).repeatForever(autoreverses: true)) {
                        viewModel.fireScale = 1.1
                    }
                }
            }
        }
    }
    
    private var galleryView: some View {
        VStack(spacing: 20) {
            
            // Header
            header
            
            // Selected fire preview
            selectedFirePreview
            
            // Fire selection
            fireSelection
            
        }
    }
    private var header: some View {
        HStack(spacing: 30) {
            Button(action: { dismiss() }) {
                Image(systemName: Icons.leftArrow)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(width: 44, height: 44)
            }
            
            Spacer()
            
            Text(L10n.Fire.fireTitle)
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .foregroundColor(.white)
                .layoutPriority(1)
            
            Spacer()
            
            Button(action: { showInfo = true }) {
                Image(systemName: Icons.about)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(width: 44, height: 44)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(Color.black.opacity(0.3))
        .fixedSize(horizontal: true, vertical: false)
    }
    
    private var selectedFirePreview: some View {
        VStack{
            Button {
                withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                    viewModel.isFullscreen = true
                    viewModel.showTapHint = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        withAnimation {
                            viewModel.showTapHint = false
                        }
                    }
                }
            } label: {
                VStack(spacing: 16) {
                    GIFImageView(gifName: viewModel.selectedFire, contentMode: .scaleAspectFill)
                        .frame(height: 400)
                        .frame(maxWidth: .infinity)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(color: .orange.opacity(0.5), radius: 20, x: 0, y: 0)
                        .contentShape(Rectangle())
                    
                    Text(L10n.Common.tapToMeditate)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.white.opacity(0.7))
                }
                .padding(.vertical, 20)
            }
            .buttonStyle(.plain)
        }
    }
    private var fireSelection: some View {
        VStack(spacing: 30) {
            Text(L10n.Fire.fireChoose)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    Color.clear
                        .frame(width: 10)
                    ForEach(viewModel.fireNames, id: \.self) { name in
                        Button {
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                viewModel.selectedFire = name
                            }
                        } label: {
                            FireSelectionItem(
                                imageName: name,
                                isSelected: name == viewModel.selectedFire
                            )
                            .contentShape(Rectangle())
                        }
                        .buttonStyle(.plain)
                    }
                    Color.clear
                        .frame(width: 10)
                }
            }
            .fixedSize(horizontal: true, vertical: false)
        }
        .padding(.vertical)
    }
}

// MARK: - Preview
#Preview {
    FireMeditationView()
}
