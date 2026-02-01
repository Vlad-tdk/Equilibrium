//
//  StatsPeriod.swift
//  Equilibrium
//
//  Created by Vlad on 30. 1. 2026..
//

import SwiftUI

// MARK: - Stats Period
enum StatsPeriod: String, CaseIterable {
    case week
    case month
    case allTime
    
    var period: LocalizedStringKey {
        switch self {
        case .week: return L10n.StatisticsView.periodWeek
        case .month: return L10n.StatisticsView.periodMonth
        case .allTime: return L10n.StatisticsView.periodAllTime
        }
    }
}
