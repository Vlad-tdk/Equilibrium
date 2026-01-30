//
//  MeditationType.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 30. 1. 2026..
//

import Foundation
import SwiftUI

// MARK: - Meditation Types
enum MeditationType: String, CaseIterable, Identifiable {
    case breath = "Breathing Training"
    case mandala = "Mandala Meditation"
    case images = "Calming Pictures"
    case fire = "Fire Meditation"
    case antiStress = "Anti Stress Training"
    case about = "About App"
    
    var id: String { rawValue }
    
    var title: String { rawValue }
    
    var subtitle: String {
        switch self {
        case .breath: return "Calm your mind with breathing"
        case .mandala: return "Focus through sacred geometry"
        case .images: return "Peaceful visual meditation"
        case .fire: return "Cleansing flame meditation"
        case .antiStress: return "Interactive particle therapy"
        case .about: return "Learn about the app"
        }
    }
    
    var icon: String {
        switch self {
        case .breath: return "wind"
        case .mandala: return "circle.hexagongrid"
        case .images: return "photo.on.rectangle.angled"
        case .fire: return "flame.fill"
        case .antiStress: return "sparkles"
        case .about: return "info.circle.fill"
        }
    }
    
    var gradientColors: [Color] {
        switch self {
        case .breath: return [Color(hex: "6DD4FF"), Color(hex: "4A90E2")]
        case .mandala: return [Color(hex: "A18CD1"), Color(hex: "FBC2EB")]
        case .images: return [Color(hex: "89F7FE"), Color(hex: "66A6FF")]
        case .fire: return [Color(hex: "FF6B6B"), Color(hex: "FFE66D")]
        case .antiStress: return [Color(hex: "6EE7B7"), Color(hex: "3B82F6")]
        case .about: return [Color(hex: "9CA3AF"), Color(hex: "6B7280")]
        }
    }
}
