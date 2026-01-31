//
//  RatingPromptView.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 31. 1. 2026..
//

import SwiftUI

// MARK: - Rating Prompt View
struct RatingPromptView: View {
    @ObservedObject var ratingManager = RatingManager.shared
    @State private var selectedRating: Int = 0
    
    var body: some View {
        ZStack {
            // Semi-transparent background
            Color.black.opacity(0.4)
                .ignoresSafeArea()
                .onTapGesture {
                    // Allow dismiss by tapping outside
                    ratingManager.userDismissed()
                }
            
            // Prompt card
            VStack(spacing: 0) {
                // Close button
                HStack {
                    Spacer()
                    Button(action: {
                        ratingManager.userDismissed()
                    }) {
                        Image(systemName: Icons.xmarkCircleFill)
                            .font(.system(size: 24))
                            .foregroundColor(.white.opacity(0.6))
                    }
                    .padding()
                }
                
                VStack(spacing: 24) {
                    // Icon
                    ZStack {
                        Circle()
                            .fill(Colors.RatingPromptViewColors.circleGradientColor)
                            .frame(width: 80, height: 80)
                        
                        Image(systemName: Icons.heartFill)
                            .font(.system(size: 40))
                            .foregroundColor(.white)
                    }
                    
                    // Title
                    VStack(spacing: 8) {
                        Text(L10n.RatingPromptView.title)
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                        
                        Text(L10n.RatingPromptView.message)
                            .font(.system(size: 16))
                            .foregroundColor(.white.opacity(0.8))
                            .multilineTextAlignment(.center)
                    }
                    
                    // Star rating (optional - for visual appeal)
                    HStack(spacing: 12) {
                        ForEach(1...5, id: \.self) { star in
                            Button(action: {
                                selectedRating = star
                                // Auto-proceed after selection
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    if star >= 4 {
                                        ratingManager.userRated()
                                    } else {
                                        ratingManager.userWantsToShareFeedback()
                                    }
                                }
                            }) {
                                Image(systemName: star <= selectedRating ? Icons.starFill : Icons.star)
                                    .font(.system(size: 32))
                                    .foregroundColor(star <= selectedRating ? .yellow : .white.opacity(0.3))
                            }
                        }
                    }
                    .padding(.vertical, 8)
                    
                    // Buttons
                    VStack(spacing: 12) {
                        Button(action: {
                            ratingManager.userRated()
                        }) {
                            Text(L10n.RatingPromptView.rateOnAppStore)
                                .font(.system(size: 17, weight: .semibold))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(
                                    Colors.RatingPromptViewColors.buttonBackgroundColor
                                )
                                .cornerRadius(12)
                        }
                        
                        Button(action: {
                            ratingManager.userWantsToShareFeedback()
                        }) {
                            Text(L10n.RatingPromptView.buttonTitleSendFeedback)
                                .font(.system(size: 15, weight: .medium))
                                .foregroundColor(.white.opacity(0.8))
                        }
                        
                        Button(action: {
                            ratingManager.userDismissed()
                        }) {
                            Text(L10n.RatingPromptView.buttonTitleMaybeLater)
                                .font(.system(size: 15))
                                .foregroundColor(.white.opacity(0.6))
                        }
                    }
                }
                .padding(32)
            }
            .background(
                RoundedRectangle(cornerRadius: 24)
                    .fill(Colors.RatingPromptViewColors.backgroundColor
                        
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 24)
                            .stroke(Color.white.opacity(0.1), lineWidth: 1)
                    )
            )
            .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 10)
            .frame(maxWidth: 340)
            .padding(.horizontal, 30)
        }
    }
}
#Preview {
    RatingPromptView()
}
