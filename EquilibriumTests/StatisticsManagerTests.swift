//
//  StatisticsManagerTests.swift
//  EquilibriumTests
//
// To enable: File > New > Target > Unit Testing Bundle in Xcode,
// name it "EquilibriumTests", then add this file to that target.
//

import XCTest
@testable import Equilibrium

final class StatisticsManagerTests: XCTestCase {

    // Use an isolated UserDefaults suite so tests don't touch real app data
    private var sut: StatisticsManager!

    override func setUp() {
        super.setUp()
        sut = StatisticsManager(defaults: UserDefaults(suiteName: "test_suite")!)
    }

    override func tearDown() {
        UserDefaults(suiteName: "test_suite")?.removePersistentDomain(forName: "test_suite")
        sut = nil
        super.tearDown()
    }

    // MARK: - getTotalSessions

    func test_getTotalSessions_startsAtZero() {
        XCTAssertEqual(sut.getTotalSessions(), 0)
    }

    func test_getTotalSessions_sumsAllFeatures() {
        sut.trackBreathSession(duration: 60, cycles: 1)
        sut.trackMandalaSession(duration: 60, mandalasViewed: 1)
        sut.trackFireSession(duration: 60)
        XCTAssertEqual(sut.getTotalSessions(), 3)
    }

    // MARK: - getTotalMinutes

    func test_getTotalMinutes_accumulatesAcrossFeatures() {
        sut.trackBreathSession(duration: 120, cycles: 1)   // 2 min
        sut.trackFireSession(duration: 180)                 // 3 min
        XCTAssertEqual(sut.getTotalMinutes(), 5)
    }

    func test_getTotalMinutes_subMinuteDurationRoundsDown() {
        sut.trackBreathSession(duration: 59, cycles: 1)
        XCTAssertEqual(sut.getTotalMinutes(), 0)
    }

    // MARK: - Streak

    func test_streak_firstSessionSetsStreakToOne() {
        sut.trackBreathSession(duration: 60, cycles: 1)
        XCTAssertEqual(sut.stats.currentStreak, 1)
        XCTAssertEqual(sut.stats.longestStreak, 1)
    }

    func test_streak_sameDaySessionDoesNotIncrement() {
        sut.trackBreathSession(duration: 60, cycles: 1)
        sut.trackBreathSession(duration: 60, cycles: 1)
        XCTAssertEqual(sut.stats.currentStreak, 1)
    }

    // MARK: - Reset

    func test_resetStats_clearsAllData() {
        sut.trackBreathSession(duration: 300, cycles: 5)
        sut.resetStats()
        XCTAssertEqual(sut.getTotalSessions(), 0)
        XCTAssertEqual(sut.getTotalMinutes(), 0)
        XCTAssertEqual(sut.stats.currentStreak, 0)
    }

    // MARK: - getMostUsedFeature

    func test_getMostUsedFeature_returnsFeatureWithMostSessions() {
        sut.trackBreathSession(duration: 60, cycles: 1)
        sut.trackBreathSession(duration: 60, cycles: 1)
        sut.trackFireSession(duration: 60)
        XCTAssertEqual(sut.getMostUsedFeature(), "Breathing")
    }
}
