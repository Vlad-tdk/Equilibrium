//
//  StorageManager.swift
//  Equilibrium
//
//  Created by Vlad on 6.9.23..
//

import UIKit

class StorageManager {
    static let shared = StorageManager()
    private let defaults = UserDefaults.standard
    private let SettingsBreathKey = "SettingsBreathKey"
    
    private init() {}
    
    func saveSettingsBreath(_ settingsColor: [ColorView] ){
        let settingsColor = settingsColor
        guard let data = try? JSONEncoder().encode(settingsColor) else { return }
        defaults.set(data, forKey: SettingsBreathKey)
    }
    
    func fetchSettingsColorBreath() -> [ColorView] {
        let viewBackGround = ColorView(red: 0, green: 0, blue: 0, alfa: 1)
        let pointBreath = ColorView(red: 1, green: 1, blue: 1, alfa: 1)
        let setColors = [viewBackGround, pointBreath]
        guard let data = defaults.data(forKey: SettingsBreathKey)else { return setColors }
        guard let settingsColorBreath = try? JSONDecoder().decode([ColorView].self, from: data) else { return [] }
        return settingsColorBreath
        }
    }

