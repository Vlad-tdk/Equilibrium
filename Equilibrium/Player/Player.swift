//
//  Player.swift
//  Equilibrium
//
//  Created by Vlad on 31.5.23..
//
import AVFoundation
import Foundation
var musicPath = Resourses.Sound.forest
let url = URL(fileURLWithPath: Bundle.main.path(forResource: musicPath, ofType:nil)!)

class Player {
    private static let player: Player = {
        return Player()
    }()
    class func defaultPlayer() -> Player { return player }
    let audior = try? AVAudioPlayer(contentsOf: url, fileTypeHint: "mp3")
}
