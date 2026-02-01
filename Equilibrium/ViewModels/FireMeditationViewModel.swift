//
//  FireMeditationViewModel.swift
//  Equilibrium
//
//  Created by Vlad on 30. 1. 2026..
//

import SwiftUI
import Combine

// MARK: - View Model
class FireMeditationViewModel: ObservableObject {
    @Published var selectedFire = "fire1"
    @Published var isFullscreen = false
    @Published var fireScale: CGFloat = 1.0
    @Published var showTapHint = false
    
    let fireNames = ["fire1", "fire2", "fire3"]
}
