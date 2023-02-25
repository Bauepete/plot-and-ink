//
//  PreferencesTests.swift
//  
//
//  Created by Peter Bauer on 25.02.23.
//

import XCTest
@testable import PlotAndInk

final class PreferencesTests: XCTestCase {
    func testThatItShouldStoreTheProjectRoot_GivenConstructed() {
        let preferences = Preferences(projectRoot: ".")
        XCTAssertEqual(preferences.projectRoot, ".")
    }
    
    func testThatItShouldReturnDefaults_GivenNoFurtherPathsAreSet() {
        let preferences = Preferences(projectRoot: ".")
        
        XCTAssertEqual(preferences.contentRoot, "./Content")
        XCTAssertEqual(preferences.publicRoot, "./Public")
        XCTAssertEqual(preferences.structureRoot, "./Structure")
        XCTAssertEqual(preferences.layoutRoot, "./Layout")
    }
}
