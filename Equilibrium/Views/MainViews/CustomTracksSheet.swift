//
//  CustomTracksSheet.swift
//  Equilibrium
//
//  NavigationView is intentionally absent — it would embed UINavigationController
//  inside UIHostingController and trigger _UIReparentingView. Uses a custom header
//  instead, matching the pattern used in NotificationSettingsView.
//

import SwiftUI
import UniformTypeIdentifiers

struct CustomTracksSheet: View {
    @ObservedObject var audioPlayer: AudioPlayerManager
    @StateObject private var manager = CustomTrackManager.shared
    @Environment(\.dismiss) private var dismiss

    @State private var showFilePicker = false
    @State private var importError: String?
    @State private var showErrorAlert = false

    var body: some View {
        ZStack {
            Colors.Palette.darkBg.ignoresSafeArea()

            VStack(spacing: 0) {
                header.frame(height: 50)

                if manager.tracks.isEmpty {
                    emptyState
                } else {
                    trackList
                }
            }
        }
        .fileImporter(
            isPresented: $showFilePicker,
            allowedContentTypes: [.audio, .mp3],
            allowsMultipleSelection: false
        ) { result in
            switch result {
            case .success(let urls):
                guard let url = urls.first else { return }
                do {
                    try manager.importTrack(from: url)
                } catch {
                    importError = error.localizedDescription
                    showErrorAlert = true
                }
            case .failure(let error):
                importError = error.localizedDescription
                showErrorAlert = true
            }
        }
        .alert("Import failed", isPresented: $showErrorAlert) {
            Button("OK", role: .cancel) {}
        } message: {
            Text(importError ?? "Unknown error")
        }
    }

    // MARK: - Header

    private var header: some View {
        HStack {
            Button("Done") { dismiss() }
                .foregroundColor(.white)

            Spacer()

            Text("My Tracks")
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .foregroundColor(.white)

            Spacer()

            Button {
                showFilePicker = true
            } label: {
                Image(systemName: "plus")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(Colors.Palette.cyan)
            }
        }
        .padding(.horizontal)
    }

    // MARK: - Track list

    private var trackList: some View {
        List {
            ForEach(manager.tracks) { track in
                Button {
                    audioPlayer.selectCustom(track)
                    dismiss()
                } label: {
                    HStack(spacing: 14) {
                        Image(systemName: "music.note")
                            .font(.system(size: 18))
                            .foregroundColor(Colors.Palette.cyan)
                            .frame(width: 32)

                        Text(track.displayName)
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.white)
                            .lineLimit(1)

                        Spacer()

                        if audioPlayer.activeCustomTrack?.id == track.id {
                            Image(systemName: "checkmark")
                                .foregroundColor(Colors.Palette.cyan)
                                .font(.system(size: 14, weight: .semibold))
                        }
                    }
                    .contentShape(Rectangle())
                }
                .listRowBackground(Color.white.opacity(0.06))
            }
            .onDelete { indexSet in
                indexSet.forEach { i in
                    let track = manager.tracks[i]
                    if audioPlayer.activeCustomTrack?.id == track.id {
                        audioPlayer.selectBuiltin(audioPlayer.currentTrack)
                    }
                    manager.deleteTrack(track)
                }
            }
        }
        .listStyle(.insetGrouped)
        .scrollContentBackground(.hidden)
    }

    // MARK: - Empty state

    private var emptyState: some View {
        VStack(spacing: 16) {
            Spacer()
            Image(systemName: "music.note.list")
                .font(.system(size: 48))
                .foregroundColor(.white.opacity(0.25))
            Text("No custom tracks yet")
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(.white.opacity(0.5))
            Text("Tap + to import an audio file\nfrom Files (mp3, m4a, wav, aac)")
                .font(.system(size: 14))
                .foregroundColor(.white.opacity(0.35))
                .multilineTextAlignment(.center)

            Button {
                showFilePicker = true
            } label: {
                Label("Import track", systemImage: "plus.circle.fill")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(Colors.Palette.cyan)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 12)
                    .background(
                        RoundedRectangle(cornerRadius: 14)
                            .fill(Colors.Palette.cyan.opacity(0.15))
                    )
            }
            .padding(.top, 8)
            Spacer()
        }
        .padding()
    }
}
