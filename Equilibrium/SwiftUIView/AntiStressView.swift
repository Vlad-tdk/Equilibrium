//
//  AntiStressView.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 26.10.24..
//

import SwiftUI

struct AntiStressView: View {
    @StateObject private var effectModel = ParticleEffectModel()
    @State private var showControlPanel = false
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                ParticleCanvas(particles: effectModel.particles, size: effectModel.particleSize)
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged { value in
                                effectModel.interactionPoint = value.location
                            }
                            .onEnded { _ in
                                effectModel.interactionPoint = CGPoint(x: -1000, y: -1000)
                            }
                    )
                    .onAppear {
                        effectModel.setupParticles(for: geometry.size)
                    }
                    .onChange(of: geometry.size) { newSize in
                        effectModel.setupParticles(for: newSize)
                    }
            }
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                if showControlPanel {
                    settingsPanel
                }
            }
        }
        .navigationTitle("")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    withAnimation {
                        showControlPanel.toggle()
                    }
                }) {
                    Image(systemName: "slider.horizontal.3")
                        .font(.title)
                        .foregroundColor(.white)
                }
            }
        }
    }
    
    private var settingsPanel: some View {
        VStack(spacing: 12) {
            ParameterSlider(value: $effectModel.particleSize, range: 2...12, title: "Particle Size")
            ParameterSlider(value: $effectModel.interactionRadius, range: 20...200, title: "Interaction Radius")
            ParameterSlider(value: $effectModel.particleVelocityFactor, range: 0.1...2.0, title: "Velocity Factor")
        }
        .padding()
        .background(Color.black.opacity(0.7))
        .cornerRadius(12)
        .padding()
    }
}
