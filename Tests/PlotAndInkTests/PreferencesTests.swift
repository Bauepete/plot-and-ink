//
//  PreferencesTests.swift
//  
//
//  Created by Peter Bauer on 25.02.23.
//

import XCTest
@testable import PlotAndInk

final class PreferencesTests: XCTestCase {
    func testThatItShouldReturnDotAsProjectRoot_GivenNoProjectRootIsSet() {
        let preferences = Preferences()
        XCTAssertEqual(preferences.projectRoot, ".")
    }
    
    func testThatItShouldStoreTheProjectRoot_GivenConstructed()  {
        let preferences = Preferences(withProjectRoot: "~")
        XCTAssertEqual(preferences.projectRoot, "~")
    }
        
    func testThatItShouldReturnHomeContent_GivenHomeIsProjectRoot() {
        let preferences = Preferences(withProjectRoot: "~")
        
        XCTAssertEqual(preferences.contentRoot, "~/Content")
        XCTAssertEqual(preferences.layoutRoot, "~/Layout")
        XCTAssertEqual(preferences.publicRoot, "~/Public")
        XCTAssertEqual(preferences.structureRoot, "~/Structure")
    }
    
    func testThatItShouldReturnDotContent_GivenDotIsProjectRoot() throws {
        let preferences = Preferences(withProjectRoot: ".")
        XCTAssertEqual(preferences.contentRoot, "./Content")
        XCTAssertEqual(preferences.layoutRoot, "./Layout")
        XCTAssertEqual(preferences.publicRoot, "./Public")
        XCTAssertEqual(preferences.structureRoot, "./Structure")
   }
}
