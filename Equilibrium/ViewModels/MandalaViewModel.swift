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
    @Published var selectedMandala = "m01"
    @Published var isFullscreen = false
    @Published var rotationAngle: Angle = .zero
    @Published var showTapHint = false
    
    let mandalaNames = (1...15).map {
        String(format: "m%02d", $0)
    }
    
    private var rotationTimer: Timer?
    
    func startRotation() {
        rotationTimer = Timer.scheduledTimer(
            withTimeInterval: 0.016, repeats: true
        ) { [weak self] _ in
            guard let self = self else { return }
            self.rotationAngle += .degrees(0.1)
        }
    }
    
    func stopRotation() {
        rotationTimer?.invalidate()
        rotationTimer = nil
    }
}
