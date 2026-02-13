//
//  Fireconstants.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 9. 2. 2026..
//

import Foundation

// MARK: - Fire Constants

enum FireConstants {
    // MARK: - Animation
    static let scaleAnimationDuration: Double = 4.0
    static let springResponse: Double = 0.4
    static let springDampingFraction: Double = 0.8
    static let selectionSpringResponse: Double = 0.3
    static let selectionSpringDampingFraction: Double = 0.7
    
    // MARK: - Scaling
    static let minScale: CGFloat = 1.0
    static let maxScale: CGFloat = 1.1
    
    // MARK: - UI Dimensions
    static let previewHeight: CGFloat = 400
    static let previewCornerRadius: CGFloat = 20
    static let headerButtonSize: CGFloat = 44
    static let headerIconSize: CGFloat = 20
    
    // MARK: - Timing
    static let tapHintDelay: Double = 3.0
}
