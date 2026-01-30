//
//  BreathSettingsView.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 30. 1. 2026..
//

import SwiftUI

// MARK: - Breath Settings View
struct BreathSettingsView: View {
    @ObservedObject var viewModel: BreathViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            ZStack {
                viewModel.backgroundColor
                    .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    // Preview
                    VStack(spacing: 20) {
                        Text("Preview")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.white)
                        
                        ZStack {
                            Circle()
                                .fill(viewModel.circleColor)
                                .frame(width: 100, height: 100)
                                .shadow(color: viewModel.circleColor.opacity(0.5), radius: 10, x: 0, y: 0)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 200)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.white.opacity(0.1))
                    )
                    .padding(.horizontal)
                    
                    // Color pickers
                    VStack(spacing: 20) {
                        ColorPickerRow(title: "Background Color", color: $viewModel.backgroundColor)
                        ColorPickerRow(title: "Circle Color", color: $viewModel.circleColor)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.white.opacity(0.1))
                    )
                    .padding(.horizontal)
                    
                    Spacer()
                }
                .padding(.top, 20)
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundColor(.white)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        viewModel.saveColors()
                        dismiss()
                    }
                    .foregroundColor(.white)
                    .font(.system(size: 17, weight: .bold))
                }
            }
        }
    }
}
