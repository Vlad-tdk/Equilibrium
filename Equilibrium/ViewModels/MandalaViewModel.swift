//
//  MandalaViewModel.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 30. 1. 2026..
//

import SwiftUI
import Combine

// MARK: - Mandala View Model
class MandalaViewModel: ObservableObject {
    @Published var selectedMandala = "m1"
    @Published var isFullscreen = false
    @Published var rotationAngle: Angle = .zero
    @Published var showTapHint = false
    
    let mandalaNames = [
        "m1", "m2", "m3", "m4", "m5", "m6", "m7", "m8", "m9", "m10",
        "m11", "m12", "m13", "m14", "m15"
    ]
    
    private var rotationTimer: Timer?
    
    func startRotation() {
        rotationTimer = Timer.scheduledTimer(withTimeInterval: 0.016, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            self.rotationAngle += .degrees(0.1)
        }
    }
    
    func stopRotation() {
        rotationTimer?.invalidate()
        rotationTimer = nil
    }
}
