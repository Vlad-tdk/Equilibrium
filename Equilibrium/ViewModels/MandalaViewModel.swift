//
//  MandalaViewModel.swift
//  Equilibrium
//
//  Created by Vlad on 30. 1. 2026..
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
    
    private var rotationCancellable: AnyCancellable?

    func startRotation() {
        rotationCancellable = Timer.publish(every: 1/60, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.rotationAngle += .degrees(0.1)
            }
    }

    func stopRotation() {
        rotationCancellable?.cancel()
        rotationCancellable = nil
    }
}
