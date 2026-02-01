//
//  MeditationType.swift
//  Equilibrium
//
//  Created by Vlad on 30. 1. 2026..
//

import Foundation
import SwiftUI

// MARK: - Meditation Types
enum MeditationType: String, CaseIterable, Identifiable {
    case breath
    case mandala
    case images
    case fire
    case antiStress
    case about
    
    var id: String { rawValue }
    
    var title: LocalizedStringKey {
        switch self {
        case .breath: return L10n.ModeMeditation.Title.breath
        case .mandala: return L10n.ModeMeditation.Title.mandala
        case .images: return L10n.ModeMeditation.Title.images
        case .fire: return L10n.ModeMeditation.Title.fire
        case .antiStress: return L10n.ModeMeditation.Title.antiStress
        case .about: return L10n.ModeMeditation.Title.about
        }
    }
    
    var subtitle: LocalizedStringKey {
        switch self {
        case .breath: return L10n.ModeMeditation.Subtitle.breath
        case .mandala: return L10n.ModeMeditation.Subtitle.mandala
        case .images: return L10n.ModeMeditation.Subtitle.images
        case .fire: return L10n.ModeMeditation.Subtitle.fire
        case .antiStress: return L10n.ModeMeditation.Subtitle.antiStress
        case .about: return L10n.ModeMeditation.Subtitle.about
        }
    }
    
    var icon: String {
        switch self {
        case .breath: return Icons.breath
        case .mandala: return Icons.mandala
        case .images: return Icons.images
        case .fire: return Icons.fire
        case .antiStress: return Icons.antiStress
        case .about: return Icons.about
        }
    }
    
    var gradientColors: [Color] {
        switch self {
        case .breath: return Colors.GradientColors.breath
        case .mandala: return Colors.GradientColors.mandala
        case .images: return Colors.GradientColors.images
        case .fire: return Colors.GradientColors.fire
        case .antiStress: return Colors.GradientColors.antiStress
        case .about: return Colors.GradientColors.about
        }
    }
}
