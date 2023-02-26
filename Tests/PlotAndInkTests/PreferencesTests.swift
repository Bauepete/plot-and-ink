//
//  PreferencesTests.swift
//  
//
//  Created by Peter Bauer on 25.02.23.
//

import XCTest
@testable import PlotAndInk

final class PreferencesTests: XCTestCase {
    override func setUp() {
        Preferences.reset()
    }
    
    func testThatItShouldFailToBeConstructed_GivenNoProjectRootIsSet() {
        XCTAssertThrowsError(_ = try Preferences.instance.projectRoot)
    }
    
    func testThatItShouldStoreTheProjectRoot_GivenConstructed() throws {
        try Preferences.set(projectRoot: ".")
        let projectRoot = try Preferences.instance.projectRoot
        XCTAssertEqual(projectRoot, ".")
    }
    
    func testThatItShouldFailToReturnAValue_GivenResetCalled() throws {
        try Preferences.set(projectRoot: "/")
        Preferences.reset()
        XCTAssertThrowsError(try Preferences.instance.projectRoot)
    }
    
    func testThatItShouldThrow_GivenTheProjectRootIsSetMoreThanOnce() throws {
        try Preferences.set(projectRoot: ".")
        XCTAssertThrowsError(try Preferences.set(projectRoot: "/"))
    }
    
    func testThatItShouldReturnHomeContent_GivenHomeIsProjectRoot() throws {
        try Preferences.set(projectRoot: "~")
        
        XCTAssertEqual(try Preferences.instance.contentRoot, "~/Content")
        XCTAssertEqual(try Preferences.instance.layoutRoot, "~/Layout")
        XCTAssertEqual(try Preferences.instance.publicRoot, "~/Public")
        XCTAssertEqual(try Preferences.instance.structureRoot, "~/Structure")
    }
    
    func testThatItShouldReturnDotContent_GivenDotIsProjectRoot() throws {
        try Preferences.set(projectRoot: ".")
        XCTAssertEqual(try Preferences.instance.contentRoot, "./Content")
        XCTAssertEqual(try Preferences.instance.layoutRoot, "./Layout")
        XCTAssertEqual(try Preferences.instance.publicRoot, "./Public")
        XCTAssertEqual(try Preferences.instance.structureRoot, "./Structure")
   }
}
