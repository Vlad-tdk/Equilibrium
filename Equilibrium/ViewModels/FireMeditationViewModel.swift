//
//  FireMeditationViewModel.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 30. 1. 2026..
//

import SwiftUI
import Combine

// MARK: - View Model
class FireMeditationViewModel: ObservableObject {
    @Published var selectedFire = "sv"
    @Published var isFullscreen = false
    @Published var fireScale: CGFloat = 1.0
    @Published var showTapHint = false
    
    let fireNames = ["sv", "sv2", "cos"]
}
