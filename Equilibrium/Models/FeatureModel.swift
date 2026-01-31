//
//  Feature.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 31. 1. 2026..
//

import SwiftUI

// MARK: - Feature Model
struct Feature: Identifiable {
    let id = UUID()
    let icon: String
    let title: LocalizedStringKey
    let description: LocalizedStringKey
}
