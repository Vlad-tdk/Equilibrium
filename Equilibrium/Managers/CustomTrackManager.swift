//
//  CustomTrackManager.swift
//  Equilibrium
//

import Foundation
import Combine

final class CustomTrackManager: ObservableObject {
    static let shared = CustomTrackManager()

    @Published private(set) var tracks: [UserTrack] = []

    private let storageDir: URL

    private enum Keys {
        static let trackList = "customTrackList"
    }

    private init() {
        let appSupport = FileManager.default.urls(
            for: .applicationSupportDirectory, in: .userDomainMask
        ).first!
        storageDir = appSupport.appendingPathComponent("CustomTracks", isDirectory: true)
        try? FileManager.default.createDirectory(at: storageDir, withIntermediateDirectories: true)
        tracks = Self.loadList()
    }

    // MARK: - Import

    /// Copies the file at `url` (security-scoped) into Application Support and registers it.
    func importTrack(from url: URL) throws {
        guard url.startAccessingSecurityScopedResource() else {
            throw ImportError.accessDenied
        }
        defer { url.stopAccessingSecurityScopedResource() }

        let ext = url.pathExtension.lowercased()
        let filename = UUID().uuidString + (ext.isEmpty ? "" : ".\(ext)")
        let destination = storageDir.appendingPathComponent(filename)

        try FileManager.default.copyItem(at: url, to: destination)

        let displayName = url.deletingPathExtension().lastPathComponent
        let track = UserTrack(id: UUID(), filename: filename, displayName: displayName)
        tracks.append(track)
        saveList()
    }

    // MARK: - Delete

    func deleteTrack(_ track: UserTrack) {
        let file = fileURL(for: track)
        try? FileManager.default.removeItem(at: file)
        tracks.removeAll { $0.id == track.id }
        saveList()
    }

    // MARK: - Helpers

    func fileURL(for track: UserTrack) -> URL {
        storageDir.appendingPathComponent(track.filename)
    }

    // MARK: - Persistence

    private func saveList() {
        if let data = try? JSONEncoder().encode(tracks) {
            UserDefaults.standard.set(data, forKey: Keys.trackList)
        }
    }

    private static func loadList() -> [UserTrack] {
        guard let data = UserDefaults.standard.data(forKey: Keys.trackList),
              let list = try? JSONDecoder().decode([UserTrack].self, from: data)
        else { return [] }
        // Remove entries whose files no longer exist
        let appSupport = FileManager.default.urls(
            for: .applicationSupportDirectory, in: .userDomainMask
        ).first!
        let dir = appSupport.appendingPathComponent("CustomTracks")
        return list.filter {
            FileManager.default.fileExists(
                atPath: dir.appendingPathComponent($0.filename).path
            )
        }
    }

    // MARK: - Errors

    enum ImportError: LocalizedError {
        case accessDenied
        var errorDescription: String? { "Could not access the selected file." }
    }
}
