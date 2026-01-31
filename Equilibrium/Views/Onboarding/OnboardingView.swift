//
//  OnboardingView_Swipeable.swift
//  Equilibrium
//
//  Swipeable onboarding (alternative version)
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentPage = 0
    var onComplete: () -> Void
    
    private let pages: [OnboardingPage] = [
        OnboardingPage(
            icon: Icons.breath,
            title: String(localized: L10n.OnboardingView.onboardingFirstTitle),
            description: String(localized: L10n.OnboardingView.onboardingFirstDescription),
            gradient: Colors.OnboardingGradientColors.firstScreen
        ),
        OnboardingPage(
            icon: Icons.circleHexagongridFill,
            title: String(localized: L10n.OnboardingView.onboardingSecondTitle),
            description: String(localized: L10n.OnboardingView.onboardingSecondDescription),
            gradient: Colors.OnboardingGradientColors.secondScreen
        ),
        OnboardingPage(
            icon: Icons.sparkles,
            title: String(localized: L10n.OnboardingView.onboardingThirdTitle),
            description: String(localized: L10n.OnboardingView.onboardingThirdDescription),
            gradient: Colors.OnboardingGradientColors.thirdScreen
        ),
        OnboardingPage(
            icon: Icons.heartFill,
            title: String(localized: L10n.OnboardingView.onboardingFourthTitle),
            description: String(localized: L10n.OnboardingView.onboardingFourthDescription),
            gradient: Colors.OnboardingGradientColors.fourthScreen
        )
    ]
    
    var body: some View {
        ZStack {
            // Background
            backgroundGradient
            
            // Content
            VStack(spacing: 0) {
                // Skip button
                skipButton
                    .padding(.top, 50)
                    .padding(.horizontal, 30)
                
                Spacer()
                
                // Swipeable pages
                TabView(selection: $currentPage) {
                    ForEach(0..<pages.count, id: \.self) { index in
                        pageView(for: pages[index])
                            .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                Spacer()
                
                // Bottom controls
                VStack(spacing: 30) {
                    pageIndicator
                    actionButton
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 50)
            }
        }
        .ignoresSafeArea()
    }
    
    // MARK: - Components
    private var backgroundGradient: some View {
        LinearGradient(
            colors: pages[currentPage].gradient,
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .animation(.easeInOut(duration: 0.5), value: currentPage)
    }
    
    private var skipButton: some View {
        HStack {
            Spacer()
            Button(L10n.OnboardingView.skipButtonTitle) {
                completeOnboarding()
            }
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(.white.opacity(0.8))
        }
    }
    
    private func pageView(for page: OnboardingPage) -> some View {
        VStack(spacing: 32) {
            ZStack {
                Circle()
                    .fill(.white.opacity(0.2))
                    .frame(width: 140, height: 140)
                
                Image(systemName: page.icon)
                    .font(.system(size: 70))
                    .foregroundColor(.white)
            }
            
            VStack(spacing: 16) {
                Text(page.title)
                    .font(.system(size: 36, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                
                Text(page.description)
                    .font(.system(size: 18))
                    .foregroundColor(.white.opacity(0.9))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
            }
        }
    }
    
    private var pageIndicator: some View {
        HStack(spacing: 12) {
            ForEach(0..<pages.count, id: \.self) { index in
                Capsule()
                    .fill(index == currentPage ? Color.white : Color.white.opacity(0.4))
                    .frame(width: index == currentPage ? 30 : 8, height: 8)
                    .animation(.spring(response: 0.3, dampingFraction: 0.7), value: currentPage)
            }
        }
    }
    
    private var actionButton: some View {
        Button(action: handleButtonTap) {
            Text(currentPage == pages.count - 1 ? String(localized:L10n.OnboardingView.startedButtonTitle) : String(localized:L10n.OnboardingView.nextButtonTitle))
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(pages[currentPage].gradient[0])
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .background(Color.white)
                .cornerRadius(28)
                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
        }
    }
    
    // MARK: - Actions
    private func handleButtonTap() {
        if currentPage < pages.count - 1 {
            withAnimation {
                currentPage += 1
            }
        } else {
            completeOnboarding()
        }
    }
    
    private func completeOnboarding() {
        UserDefaults.standard.set(true, forKey: "hasSeenOnboarding")
        onComplete()
    }
}



// MARK: - Preview
#Preview {
    OnboardingView(onComplete: {})
}
