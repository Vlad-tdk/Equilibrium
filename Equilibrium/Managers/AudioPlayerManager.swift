//
//  AudioPlayerManager.swift
//  Equilibrium
//

import AVFoundation
import Combine

class AudioPlayerManager: ObservableObject {
    @Published var isPlaying = false

    // Built-in track selection (persisted by raw string)
    @Published var currentTrack: AmbientTrack {
        didSet {
            guard activeCustomTrack == nil else { return }
            UserDefaults.standard.set(currentTrack.rawValue, forKey: Keys.currentTrack)
            reloadCurrentSource()
        }
    }

    // Non-nil when a user-imported track is active
    @Published var activeCustomTrack: UserTrack? {
        didSet {
            if let track = activeCustomTrack {
                UserDefaults.standard.set(try? JSONEncoder().encode(track), forKey: Keys.customTrack)
                UserDefaults.standard.removeObject(forKey: Keys.currentTrack)
            } else {
                UserDefaults.standard.removeObject(forKey: Keys.customTrack)
            }
        }
    }

    private var audioPlayer: AVAudioPlayer?

    private enum Keys {
        static let currentTrack = "audio_current_track"
        static let customTrack  = "audio_active_custom_track"
    }

    init() {
        // Restore last active source
        if let data = UserDefaults.standard.data(forKey: Keys.customTrack),
           let saved = try? JSONDecoder().decode(UserTrack.self, from: data) {
            let url = CustomTrackManager.shared.fileURL(for: saved)
            if FileManager.default.fileExists(atPath: url.path) {
                let saved2 = UserDefaults.standard.string(forKey: Keys.currentTrack)
                currentTrack = AmbientTrack(rawValue: saved2 ?? "") ?? .forest
                activeCustomTrack = saved
                loadFile(at: url)
                return
            }
        }

        let saved = UserDefaults.standard.string(forKey: Keys.currentTrack)
        currentTrack = AmbientTrack(rawValue: saved ?? "") ?? .forest
        activeCustomTrack = nil
        loadBuiltin(currentTrack)
    }

    // MARK: - Public selection API

    func selectBuiltin(_ track: AmbientTrack) {
        activeCustomTrack = nil
        currentTrack = track     // didSet fires → reloadCurrentSource()
    }

    func selectCustom(_ track: UserTrack) {
        let url = CustomTrackManager.shared.fileURL(for: track)
        activeCustomTrack = track
        loadFile(at: url)
        if isPlaying { audioPlayer?.play() }
    }

    // MARK: - Playback

    func togglePlayback() {
        guard let player = audioPlayer else { return }
        if isPlaying { player.pause() } else { player.play() }
        isPlaying.toggle()
    }

    func stop() {
        audioPlayer?.stop()
        isPlaying = false
    }

    // MARK: - Private loading

    private func reloadCurrentSource() {
        let wasPlaying = isPlaying
        if let custom = activeCustomTrack {
            loadFile(at: CustomTrackManager.shared.fileURL(for: custom))
        } else {
            loadBuiltin(currentTrack)
        }
        if wasPlaying { audioPlayer?.play() }
    }

    private func loadBuiltin(_ track: AmbientTrack) {
        guard let url = Bundle.main.url(forResource: track.rawValue, withExtension: "mp3") else {
            print("AudioPlayerManager: file not found — \(track.rawValue).mp3")
            return
        }
        loadFile(at: url)
    }

    private func loadFile(at url: URL) {
        audioPlayer?.stop()
        audioPlayer = nil
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.prepareToPlay()
        } catch {
            print("AudioPlayerManager: failed to load \(url.lastPathComponent) — \(error)")
        }
    }
}
