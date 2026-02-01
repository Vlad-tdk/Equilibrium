//
//  AudioPlayerManager.swift
//  Equilibrium
//
//  Created by Vlad on 6.9.23..
//

import AVFoundation
import Combine

// MARK: - Audio Player Manager
class AudioPlayerManager: ObservableObject {
    @Published var isPlaying = false
    private var audioPlayer: AVAudioPlayer?
    
    init() {
        setupAudioPlayer()
    }
    
    private func setupAudioPlayer() {
        guard let url = Bundle.main.url(
            forResource: "soundsOfTheForest", withExtension: "mp3"
        ) else {
            print("Audio file not found")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.numberOfLoops = -1 // Loop indefinitely
            audioPlayer?.prepareToPlay()
        } catch {
            print("Failed to initialize audio player: \(error)")
        }
    }
    
    func togglePlayback() {
        guard let player = audioPlayer else { return }
        
        if isPlaying {
            player.pause()
        } else {
            player.play()
        }
        isPlaying.toggle()
    }
}
