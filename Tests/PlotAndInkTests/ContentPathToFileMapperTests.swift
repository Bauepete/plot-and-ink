//
//  ContentPathToFileMapperTests.swift
//  
//
//  Created by Peter Bauer on 25.02.23.
//

import XCTest
@testable import PlotAndInk

final class ContentPathToFileMapperTests: XCTestCase {
    func testThatItShouldAddContentAndTestMd_GivenTheDefaultPreferencesAndContentPathTest() throws {
        Preferences.reset()
        try Preferences.set(projectRoot: ".")
        let filePath = ContentPathToFileMapper().map("Test")
        XCTAssertEqual(filePath, "./Content/Test.md")
    }
    
    func testThatItShouldAddContentAndAboutMd_GivenTheDefaultPreferencesAndContentPathAbout() throws {
        Preferences.reset()
        try Preferences.set(projectRoot: ".")
        let filePath = ContentPathToFileMapper().map("About")
        XCTAssertEqual(filePath, "./Content/About.md")
    }
}
