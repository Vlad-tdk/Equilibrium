//
//  FavoritesManager.swift
//  Equilibrium
//

import SwiftUI
import Combine

class FavoritesManager: ObservableObject {
    static let shared = FavoritesManager()

    @Published private(set) var favoriteMandalas: Set<String>
    @Published private(set) var favoriteImages: Set<Int>

    private enum Keys {
        static let mandalas = "favorites_mandalas"
        static let images   = "favorites_images"
    }

    private init() {
        let savedMandalas = UserDefaults.standard.stringArray(forKey: Keys.mandalas) ?? []
        favoriteMandalas = Set(savedMandalas)

        let savedImages = (UserDefaults.standard.array(forKey: Keys.images) as? [Int]) ?? []
        favoriteImages = Set(savedImages)
    }

    // MARK: - Mandalas

    func toggleMandala(_ name: String) {
        if favoriteMandalas.contains(name) {
            favoriteMandalas.remove(name)
        } else {
            favoriteMandalas.insert(name)
        }
        UserDefaults.standard.set(Array(favoriteMandalas), forKey: Keys.mandalas)
    }

    func isFavoriteMandala(_ name: String) -> Bool {
        favoriteMandalas.contains(name)
    }

    // MARK: - Images

    func toggleImage(_ index: Int) {
        if favoriteImages.contains(index) {
            favoriteImages.remove(index)
        } else {
            favoriteImages.insert(index)
        }
        UserDefaults.standard.set(Array(favoriteImages), forKey: Keys.images)
    }

    func isFavoriteImage(_ index: Int) -> Bool {
        favoriteImages.contains(index)
    }
}
