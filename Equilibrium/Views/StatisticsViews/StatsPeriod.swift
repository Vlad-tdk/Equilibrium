//
//  StatsPeriod.swift
//  Equilibrium
//
//  Created by Vladimir Martemianov on 31. 1. 2026..
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
