//
//  AmbientTrack.swift
//  Equilibrium
//
// To add a track: drop an .mp3 into the project and add its filename below.
//

import Foundation

enum AmbientTrack: String, CaseIterable, Codable {
    case forest = "soundsOfTheForest"
    case rain   = "soundsOfRain"
    case ocean  = "soundsOfOcean"
    case wind   = "soundsOfWind"

    var displayName: String {
        switch self {
        case .forest: "Forest"
        case .rain:   "Rain"
        case .ocean:  "Ocean"
        case .wind:   "Wind"
        }
    }

    var icon: String {
        switch self {
        case .forest: "leaf.fill"
        case .rain:   "cloud.rain.fill"
        case .ocean:  "water.waves"
        case .wind:   "wind"
        }
    }
}
