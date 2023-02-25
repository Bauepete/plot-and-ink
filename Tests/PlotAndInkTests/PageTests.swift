//
//  PageTests.swift
//  
//
//  Created by Peter Bauer on 25.02.23.
//

import XCTest
import Plot
@testable import PlotAndInk

final class PageTests: XCTestCase {
    func testThatItShouldAcceptStructureAndContent_GivenConstructed() {
        let html = HTML(
            .head(.title("Test")),
            .body(
                .h1("Test")
            )
        )
        let md = """
# Headline
and a text
"""
        let page = Page(structure: html, content: md)
        XCTAssertNotNil(page.structure)
    }
}
