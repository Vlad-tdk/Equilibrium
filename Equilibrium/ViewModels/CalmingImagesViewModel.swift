//
//  CalmingImagesViewModel.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 30. 1. 2026..
//

import SwiftUI
import Combine

// MARK: - View Model
class CalmingImagesViewModel: ObservableObject {
    @Published var selectedIndex = 0
    @Published var isFullscreen = false
    
    let imageNames = [
        "1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
        "11", "12", "13", "14", "15", "16", "17", "18", "19", "20",
        "21", "22", "23", "24", "25", "27", "34", "35", "54", "77",
        "81", "83"
    ]
}
