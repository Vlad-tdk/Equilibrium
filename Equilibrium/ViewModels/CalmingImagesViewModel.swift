//
//  CalmingImagesViewModel.swift
//  Equilibrium
//
//  Created by Vlad on 30. 1. 2026..
//

import SwiftUI
import Combine

// MARK: - View Model
class CalmingImagesViewModel: ObservableObject {
    @Published var selectedIndex = 0
    @Published var isFullscreen = false
    
    let imageNames = (1...38).map(String.init)
}
