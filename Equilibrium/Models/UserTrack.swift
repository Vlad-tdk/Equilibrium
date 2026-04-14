//
//  UserTrack.swift
//  Equilibrium
//

import Foundation

struct UserTrack: Codable, Identifiable, Equatable {
    let id: UUID
    let filename: String     // filename inside Application Support/CustomTracks/
    var displayName: String

    static func == (lhs: UserTrack, rhs: UserTrack) -> Bool { lhs.id == rhs.id }
}
