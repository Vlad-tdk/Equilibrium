//
//  Feature.swift
//  Equilibrium
//
//  Created by Vlad on 30. 1. 2026..
//

import SwiftUI

// MARK: - Feature Model
struct Feature: Identifiable {
    let id = UUID()
    let icon: String
    let title: LocalizedStringKey
    let description: LocalizedStringKey
}
